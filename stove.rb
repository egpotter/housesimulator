require 'savon'

client = Savon.client(wsdl: 'http://localhost:3000/information/wsdl')


def notify_person(client)
	r = client.call(:get_active_devices_from_localization, message: {"room_name" => "bedroom"})
	r2 = client.call(:get_active_devices_by_functionality, message: {"functionality" => "show_text"})
	useful_devices = r.body[:get_active_devices_from_localization_response][:value] & r2.body[:get_active_devices_by_functionality_response][:value]
	device_name = client.call(:get_device_name, message: {"device_id" => useful_devices.first})
	device_name = device_name.body[:get_device_name_response][:value]
	operation = "show_text_" + device_name
	operation = operation.to_sym
	new_client = Savon.client(wsdl: 'http://localhost:3000/web_service/wsdl?'+device_name)
	st_response = new_client.call(operation, :message => {"device_id" => useful_devices.first, "text" => "Stove is turned on!"})
end

def is_stove_turned_on?(client)
	stove_status = client.call(:get_status_device, message: {"device_id" => 95, "status" => "on"})
	stove_status = stove_status.body[:get_status_device_response][:value] 
	stove_status == "true" || stove_status == true
end

def is_person_in_kitchen?(client)
	r = client.call(:get_localization_from_person , message: {"person_name" => "eduardo"})
	localization = r.body[:get_localization_from_person_response][:value]
	localization == "kitchen"
end

while is_stove_turned_on?(client)
	if is_person_in_kitchen?(client)
		puts "Person is in kitchen"
	else
		puts "Person is not in kitchen"
		sleep 5
		if is_stove_turned_on?(client)
			if !is_person_in_kitchen?(client)
				notify_person(client)
				puts "Person was notified"
				break
			else
				sleep 5
			end
		end			
	end
end
