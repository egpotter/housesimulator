class OrganizationCall < ActiveRecord::Base
	after_find :set_status

	def set_status
		self.update_attribute(:status, 1) if self.updated_at <= self.call_duration.seconds.ago
	end

	def going?	
		self.status == 0 || self.status.nil? 
	end

	def arrived?
		self.status == 1
	end
end