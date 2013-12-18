class Status < ActiveRecord::Base
	before_create :set_value
	belongs_to :device_room
	belongs_to :person

	def set_value
		if self.name == "active"
			self.value = "true"
		elsif self.name == "on"
			self.value = "false"
		elsif self.name == "light_type"
			self.value = "intense"
		elsif self.name == "opening_level"
			self.value = "close"
		elsif self.name == "zoom_type"
			self.value = "normal"
		elsif self.name == "open"
			self.value = "false"
		elsif self.name == "locked"
			self.value = "true"
		elsif self.name == "busy"
			self.value = "false"
		elsif self.name == "showing_text"
			self.value = "false"
		elsif self.name == "showing_image"
			self.value = "false"
		elsif self.name == "playing_sound"
			self.value = "false"
		elsif self.name == "playing_video"
			self.value = "false"
		end
	end


	def get_values
		if ["active", "open", "playing_sound", "playing_video", "showing_image", "showing_text", "busy", "locked", "open", "on", "stroke", "shock", "dehydration", "diabetes_complication", "asthma_attack"].include? self.name 
			values = ["true" , "false"]
		elsif self.name == "light_type"
			values = ["intense", "dimmed", "pulsating" ]
		elsif self.name == "opening_level"
			values = ["close", "semi-open", "open"]
		elsif self.name == "zoom_type"
			values = ["normal", "in", "out" ]
		elsif self.name == 'agitation'
			values = ["high", "intermediate", "low", 'none' ]
		elsif self.name == 'spinal_injury'
			values = ["true", "false" ]
		elsif self.name == 'glucose_level' || self.name == 'temperature'
			values = ["high", "medium", "low" ]
		end
		values
	end

	def get_data
		{
			name: self.name,
			value: self.value			
		}
	end
end
