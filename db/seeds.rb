# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["radio_clock", "gas_controller", "eletronic_photo_album", "watch", "smart_wardrobe", "smart_pillow", "smart_window", "curtain", "roof_light", "lamp", "mirror", "sprinkler", "door", "shower", "microwave", "window", "luminaire", "latrine", "tap", "stove", "oven", "wash_machine", "smart_painting", "smart_refrigerator", "exhauster", "agenda_type_2", "television_type_1", "computer_type_2", "agenda_type_1", "television_type_2", "computer_type_1", "mobile_phone"].each do |device_name|
	d = Device.create(name: device_name)
	puts d.errors.messages
end	


