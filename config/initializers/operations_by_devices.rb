# [:get_localization_from_person => [], :get_localization_from_device, :turn_on, :turn_off, :show_text, :show_image, :play_video, :play_sound, :open_curtain, :open_halfway_curtain, :close_curtain, :lock, :unlock, :set_intense_light, :set_dimmed_light, :set_pulsating_light, :activate_water, :deactivate_water, :open_door, :close_door, :open_tap, :close_tap, :set_zoom_in, :set_zoom_normal, :set_zoom_out, :open_valve, :close_valve]

### Current device list ### Is television necessary? It was not on the last list
# ["radio_clock", "smart_wardrobe", "smart_pillow", "smart_window", "curtain", "roof_light", "lamp", "mirror",  "sprinkler", "door", "computer", "agenda", "window", "luminaire", "shower", "latrine", "tap", "microwave", "smart_painting", "stove", "oven", "smart_refrigerator", "exhauster", "wash_machine", "gas_controller", "eletronic_photo_album", "watch", "television"] 


OPERATIONS_BY_DEVICE = {
	"radio_clock" => ["turn_on_radio_clock", "turn_off_radio_clock", "show_text_radio_clock", "play_sound_radio_clock"],
	"smart_wardrobe" => ["show_text_smart_wardrobe","show_image_smart_wardrobe", "turn_on_smart_wardrobe", "turn_off_smart_wardrobe"],
	"smart_pillow" => ["show_text_smart_pillow","show_image_smart_pillow", "play_sound_smart_pillow", "play_video_smart_pillow", "turn_on_smart_pillow", "turn_off_smart_pillow"],
	"smart_window" => ["show_text_smart_window","show_image_smart_window", "turn_on_smart_window", "turn_off_smart_window"],
	"curtain" => ["open_curtain", "close_curtain", "open_halfway_curtain"],
	"roof_light" => ["turn_on_roof_light", "turn_off_roof_light", "set_pulsating_light_roof_light", "set_dimmed_light_roof_light", "set_intense_light_roof_light"],
	"lamp" => ["turn_on_lamp", "turn_off_lamp", "set_pulsating_light_lamp", "set_dimmed_light_lamp", "set_intense_light_lamp"],
	"mirror" => ["show_text_mirror","show_image_mirror", "turn_on_mirror", "turn_off_mirror", "set_zoom_in_mirror", "set_zoom_out_mirror", "set_zoom_normal_mirror"],
	"sprinkler" => ["turn_on_sprinkler", "turn_off_sprinkler"],
	"door" => ["open_door", "close_door", "lock_door", "unlock_door"],
	"computer_type_1" => ["show_text_computer_type_1","show_image_computer_type_1", "play_sound_computer_type_1","play_video_computer_type_1", "turn_on_computer_type_1", "turn_off_computer_type_1"],
	"computer_type_2" => ["show_text_computer_type_2","show_image_computer_type_2", "play_sound_computer_type_2","play_video_computer_type_2", "turn_on_computer_type_2", "turn_off_computer_type_2"],
	"agenda_type_1" => ["show_text_agenda_type_1","show_image_agenda_type_1", "play_sound_agenda_type_1", "turn_on_agenda_type_1", "turn_off_agenda_type_1"],
	"agenda_type_2" => ["show_text_agenda_type_2","show_image_agenda_type_2", "play_sound_agenda_type_2", "turn_on_agenda_type_2", "turn_off_agenda_type_2"],
	"window" => ["lock_window", "unlock_window", "open_window", "close_window", "open_halfway_window"],
	"luminaire" => ["turn_on_luminaire", "turn_off_luminaire", "set_pulsating_light_luminaire", "set_dimmed_light_luminaire", "set_intense_light_luminaire"],
	"shower" => ["turn_on_shower", "turn_off_shower"],
	"latrine" => ["activate_water_latrine", "deactivate_water_latrine"],
	"tap" => ["open_tap", "close_tap"],
	"microwave" => ["show_text_microwave", "play_sound_microwave", "turn_on_microwave", "turn_off_microwave"],
	"smart_painting" => ["show_text_smart_painting","show_image_smart_painting", "turn_on_smart_painting", "turn_off_smart_painting"],
	"stove" => ["turn_on_stove", "turn_off_stove"],
	"oven" => ["turn_on_oven", "turn_off_oven"],
	"smart_refrigerator" => ["show_text_smart_refrigerator","show_image_smart_refrigerator", "play_sound_smart_refrigerator", "turn_on_smart_refrigerator", "turn_off_smart_refrigerator"],
	"exhauster" => ["turn_on_exhauster", "turn_off_exhauster"],
	"wash_machine" => ["turn_on_wash_machine", "turn_off_wash_machine"],
	"gas_controller" => ["open_valve_gas_controller", "close_valve_gas_controller"],
	"eletronic_photo_album" => ["show_text_eletronic_photo_album","show_image_eletronic_photo_album", "play_sound_eletronic_photo_album", "turn_on_eletronic_photo_album", "turn_off_eletronic_photo_album"],
	"watch" => ["show_text_watch", "play_sound_watch", "turn_on_watch", "turn_off_watch"],
	"television_type_1" => ["show_text_television_type_1","show_image_television_type_1", "play_sound_television_type_1","play_video_television_type_1", "turn_on_television_type_1", "turn_off_television_type_1"],
	"television_type_2" => ["show_text_television_type_2","show_image_television_type_2", "play_sound_television_type_2","play_video_television_type_2", "turn_on_television_type_2", "turn_off_television_type_2"],
	"mobile_phone" => ["show_text_mobile_phone","show_image_mobile_phone", "play_sound_mobile_phone","play_video_mobile_phone", "turn_on_mobile_phone", "turn_off_mobile_phone"]
}