class Organization < ActiveRecord::Base
	validates :name, uniqueness: true, :presence => true
	has_many :organization_calls, :order => "created_at desc"
	after_find :set_status

	def set_status
		self.update_attribute(:status, 0) if self.last_call && (self.last_call.created_at < (self.last_call.call_duration + 30).seconds.ago)
	end

	def idle?
		self.status == 0 || self.status.nil? || self.updated_at <= 60.seconds.ago
	end

	def called?
		self.status == 1 && self.updated_at > 60.seconds.ago
	end

	def call
		call = self.last_call
		if call 
			if (  call.created_at < (call.call_duration + 30).seconds.ago )
				answer = OrganizationCall.create(organization_id: self.id, call_duration: rand(60))
				Log.create(status:true, kind:4, description: "Organization #{self.name} was called!")
			else
				answer = nil
			end
		else 
			answer =OrganizationCall.create(organization_id: self.id, call_duration: rand(60))
			Log.create(status:true, kind:4, description: "Organization #{self.name} was called!")
		end
		if answer
			self.updated_at = Time.now
			self.status = 1
			self.save
		end 
		answer
	end

	def get_time_for_organization_arrival
		call = self.organization_calls.first
		if call
			timediff = Time.now - call.created_at	
			if ( timediff ) > call.call_duration 
				result = "organization has arrived"
			else
				result = "Time left: #{call.call_duration - timediff.to_i}"
			end
		end
	end

	def last_call
		self.organization_calls.first
	end

end
