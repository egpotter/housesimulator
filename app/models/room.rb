class Room < ActiveRecord::Base
	validates :name, uniqueness: true, :presence => true
	has_many :device_rooms, :dependent => :destroy
	has_many :devices, :through => :device_rooms
	has_many :people, :dependent => :destroy
	has_many :stuffs, :dependent => :destroy
	def add_device(device_id)
		DeviceRoom.create(device_id: device_id, room_id: self.id)
	end
end
