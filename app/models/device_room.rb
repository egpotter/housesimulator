class DeviceRoom < ActiveRecord::Base
	belongs_to :device
	belongs_to :room
	has_many :statuses,:dependent => :destroy, :order => :name
	after_create :create_statuses
	accepts_nested_attributes_for :statuses
# ACTIVE_STATUS_DEVICES, ON_STATUS_DEVICES LIGHT_TYPE_STATUS_DEVICES OPENING_LEVEL_STATUS_DEVICES 
# ZOOM_TYPE_STATUS_DEVICES OPEN_STATUS_DEVICES LOCKED_STATUS_DEVICES BUSY_STATUS_DEVICS 
# SHOWING_TEXT_STATUS_DEVICES SHOWING_IMAGE_STATUS_DEVICES PLAYING_SOUND_STATUS_DEVICES
	def self.update_statuses
		result = self.joins(:statuses).where("name = 'busy' and value = 'true' and statuses.updated_at < ?", 30.seconds.ago)
		result.each do |d|
			d.set_status("busy", "false")
			d.set_status("playing_sound", "false")
			d.set_status("playing_video", "false")
			d.set_status("showing_image", "false")
			d.set_status("showing_text", "false")
		end
	end

	def self.get_last_changed
		# aux = self.joins(:statuses).where("statuses.updated_at > ?", 30.seconds.ago)
		l = Log.where("created_at > ? and kind = 1 and status=true", 30.seconds.ago).map {|l| l.device_room }.uniq
		result = l
		result.uniq
	end

	def create_statuses
		STATUS_BY_DEVICES[self.device.name].each do |status|
			Status.create(device_room_id: self.id, name: status)
		end
	end

	def get_status(name)
		status = self.statuses.where("name = ?", name).take
		status.value if status
	end

	def set_status(name, value)
		status = self.statuses.where("name = ?", name).take
		status.update_attribute(:value, value) if status
	end

	def turn_on
		if self.get_status("on") == "false" && self.get_status("active") == "true"
			self.set_status("on", "true")
			result = true
		else
			result = false
		end
		result	
	end

	def turn_off
		if self.get_status("on") == "true" && self.get_status("active") == "true"
			self.set_status("on", "false")
			result = true
		else
			result = false
		end
		result	
	end

	def show_text(url)
		if self.get_status("on") == "true" && self.get_status("active") == "true" && self.get_status("showing_text") == "false" && self.get_status("busy") == "false"
			self.set_status("busy", "true")
			self.set_status("showing_text", "true")
			result = true
		else
			result = false
		end
		result	
	end

	def show_image(url)
		if self.get_status("on") == "true" && self.get_status("active") == "true" && self.get_status("showing_image") == "false" && self.get_status("busy") == "false" 
			self.set_status("busy", "true")
			self.set_status("showing_image", "true")			
			result = true
		else
			result = false
		end
		result	
	end

	def play_video(url)
		if self.get_status("on") == "true" && self.get_status("active") == "true" && self.get_status("playing_video") == "false" && self.get_status("busy") == "false" 
			self.set_status("busy", "true")
			self.set_status("playing_video", "true")			
			result = true
		else
			result = false
		end
		result	
	end

	def play_sound(url)
		if self.get_status("on") == "true" && self.get_status("active") == "true" && self.get_status("playing_sound") == "false" && self.get_status("busy") == "false" 
			self.set_status("busy", "true")
			self.set_status("playing_sound", "true")			
			result = true
		else
			result = false
		end
		result	
	end

	def open_curtain
		if self.get_status("active") == "true" && ( self.get_status("opening_level") == "semi-open" || self.get_status("opening_level") == "close" )
			self.set_status("opening_level", "open")			
			result = true
		else
			result = false
		end
		result
	end

	def open_halfway_curtain
		if self.get_status("active") == "true" && ( self.get_status("opening_level") == "open" || self.get_status("opening_level") == "close" )
			self.set_status("opening_level", "semi-open")			
			result = true
		else
			result = false
		end
		result
	end

	def close_curtain
		if self.get_status("active") == "true" && ( self.get_status("opening_level") == "semi-open" || self.get_status("opening_level") == "open" )
			self.set_status("opening_level", "close")			
			result = true
		else
			result = false
		end
		result
	end

	def lock 	
		if self.get_status("active") == "true" && self.get_status("locked") == "false" #Isnt it necesseary to be also closed?
			self.set_status("locked", "true")			
			result = true
		else
			result = false
		end
		result
	end

	def unlock 	
		if self.get_status("active") == "true" && self.get_status("locked") == "true" 
			self.set_status("locked", "false")			
			result = true
		else
			result = false
		end
		result
	end

	def set_intense_light
		if self.get_status("on") == "true" && self.get_status("active") == "true" && ( self.get_status("light_type") == "pulsating" || self.get_status("light_type") == "dimmed" ) 
			self.set_status("light_type", "intense")	
			result = true
		else
			result = false
		end
		result	
	end

	def set_pulsating_light
		if self.get_status("on") == "true" && self.get_status("active") == "true" && ( self.get_status("light_type") == "intense" || self.get_status("light_type") == "dimmed" ) 
			self.set_status("light_type", "pulsating")	
			result = true
		else
			result = false
		end
		result	
	end

	def set_dimmed_light
		if self.get_status("on") == "true" && self.get_status("active") == "true" && ( self.get_status("light_type") == "intense" || self.get_status("light_type") == "pulsating" ) 
			self.set_status("light_type", "dimmed")	
			result = true
		else
			result = false
		end
		result	
	end

	def activate_water
		if self.get_status("on") == "true" && self.get_status("active") == "true" && self.get_status("busy") == "false"
			self.set_status("busy", "true")
			result = true
		else
			result = false
		end
		result	
	end

	def deactivate_water
		if self.get_status("on") == "true" && self.get_status("active") == "true" && self.get_status("busy") == "true"
			self.set_status("busy", "false")
			result = true
		else
			result = false
		end
		result	
	end

	def open_door
		if self.get_status("active") == "true" && self.get_status("open") == "false" && self.get_status("locked") == "false"
			self.set_status("open", "true")
			result = true
		else
			result = false
		end
		result	
	end

	def close_door
		if self.get_status("active") == "true" && self.get_status("open") == "true" 
			self.set_status("open", "false")
			result = true
		else
			result = false
		end
		result	
	end

	def open_tap
		if self.get_status("active") == "true" && self.get_status("open") == "false" 
			self.set_status("open", "true")
			result = true
		else
			result = false
		end
		result	
	end

	def close_tap
		if self.get_status("active") == "true" && self.get_status("open") == "true" 
			self.set_status("open", "false")
			result = true
		else
			result = false
		end
		result	
	end

	def set_zoom_in
		if self.get_status("active") == "true" && self.get_status("on") == "true" && (self.get_status("zoom_type") == "out" || self.get_status("zoom_type") == "normal")
			self.set_status("zoom_type", "in")
			result = true
		else
			result = false
		end
		result	
	end

	def set_zoom_normal
		if self.get_status("active") == "true" && self.get_status("on") == "true" && (self.get_status("zoom_type") == "out" || self.get_status("zoom_type") == "in")
			self.set_status("zoom_type", "normal")
			result = true
		else
			result = false
		end
		result	
	end

	def set_zoom_out
		if self.get_status("active") == "true" && self.get_status("on") == "true" && (self.get_status("zoom_type") == "in" || self.get_status("zoom_type") == "normal")
			self.set_status("zoom_type", "out")
			result = true
		else
			result = false
		end
		result	
	end

	def open_valve
		if self.get_status("active") == "true" && self.get_status("open") == "false" 
			self.set_status("open", "true")
			result = true
		else
			result = false
		end
		result	
	end

	def close_valve
		if self.get_status("active") == "true" && self.get_status("open") == "true" 
			self.set_status("open", "false")
			result = true
		else
			result = false
		end
		result	
	end
end