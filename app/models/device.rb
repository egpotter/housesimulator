class Device < ActiveRecord::Base
	# before_save :generate_log
	has_many :device_rooms
	has_many :rooms, :through => :device_rooms
	validates :name, uniqueness: true, :presence => true

	attr_accessor :url	

	# def generate_log
	# 	if @changed_attributes["status"] 
	# 		if status == "on" || status == "off" || status == "closed" || status == "opened" ||status == "half_opened" 
	# 			Log.create(old_status: @changed_attributes["status"], new_status: self.status, device_id: self.id, kind: 1)
	# 		elsif status == "text" 
	# 			Log.create(old_status: @changed_attributes["status"], new_status: self.status, device_id: self.id, kind: 4, url: self.url) 
	# 		end
	# 	end
	# end

	def self.set_active_devices(array_ids)
		self.update_all("active = false")
		array_ids.each do |id|
			self.find(id).update_attribute(:active, true)
		end if !array_ids.nil?
	end

end
