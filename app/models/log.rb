class Log < ActiveRecord::Base
	belongs_to :device_room
	#kind = 1 turn on or off
	#kind = 2 start simulation
	#kind = 3 finish simulation
	#kind = 4 rich content
	default_scope order(:created_at)
end
