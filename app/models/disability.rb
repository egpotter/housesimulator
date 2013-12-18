class Disability < ActiveRecord::Base
	validates :name, :presence => true
	validates :level, :presence => true

	def get_data
		{
			name: self.name,
			level: self.level			
		}
	end
end