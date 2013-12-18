r = []
aux= []
OPERATIONS_BY_DEVICE.each do |k, v| 
	r=r+v
end
r.uniq!
r.each do |operation|
	aux[operation] = []
end

r.each do |operation|
	OPERATIONS_BY_DEVICE.each do |device_name, operations_array|
	        if operations_array.include? operation
	        	aux[operation] << device_name
	        end
	end 
end


####################

r = {}
aux= {}
OPERATIONS_BY_DEVICE.each do |device_name, operations_array|
    r[device_name] = []
end

r.each do |dn, sa|
	sa << "active" if ACTIVE_STATUS_DEVICES.include? dn
	sa << "on" if ON_STATUS_DEVICES.include? dn
	sa << "light_type" if LIGHT_TYPE_STATUS_DEVICES.include? dn
	sa << "opening_level" if OPENING_LEVEL_STATUS_DEVICES.include? dn
	sa << "zoom_type" if ZOOM_TYPE_STATUS_DEVICES.include? dn
	sa << "open" if OPEN_STATUS_DEVICES.include? dn
	sa << "locked" if LOCKED_STATUS_DEVICES.include? dn
	sa << "busy" if BUSY_STATUS_DEVICES.include? dn
	sa << "showing_text" if SHOWING_TEXT_STATUS_DEVICES.include? dn
	sa << "showing_image" if SHOWING_IMAGE_STATUS_DEVICES.include? dn
	sa << "playing_sound" if PLAYING_SOUND_STATUS_DEVICES.include? dn
	sa << "playing_video" if PLAYING_VIDEO_STATUS_DEVICES.include? dn 
end 
