class Simulation < ActiveRecord::Base
	after_save :generate_log

	def generate_log
		if self.active == true
			Log.create( kind: 2) #Simulation started 
		else 
			Log.create( kind: 3) #Simulation finished
		end
	end

	def self.started?
		if self.last && self.last.active == true
			true
		else
			false
		end
	end

	def finish
		self.update_attribute(:active, false)
	end

end
