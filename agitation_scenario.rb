require 'savon'

def get_status_level(status_name, patient)
	answer = nil
	patient[:status].each do |status|
		answer = status[:value] if status[:name] == status_name
	end
	answer
end

def inform_use_of_drugs(client,person)
	r = client.call(:get_active_devices_from_localization, message: {"room_name" => person[:location]})
	r2 = client.call(:get_active_devices_by_functionality, message: {"functionality" => "show_text"})
	useful_devices = r.body[:get_active_devices_from_localization_response][:value] & r2.body[:get_active_devices_by_functionality_response][:value]
	device_name = client.call(:get_device_name, message: {"device_id" => useful_devices.first})
	device_name = device_name.body[:get_device_name_response][:value]
	operation = "show_text_" + device_name
	operation = operation.to_sym
	new_client = Savon.client(wsdl: 'http://localhost:3000/web_service/wsdl?'+device_name)
	st_response = new_client.call(operation, :message => {"device_id" => useful_devices.first, "text" => "Urgent use of drugs!"})
	st_response.body["#{operation}_response".to_sym][:value] == "ok"
end

def calm_patient(client,person)
	r = client.call(:get_active_devices_from_localization, message: {"room_name" => person[:location]})
	r2 = client.call(:get_active_devices_by_functionality, message: {"functionality" => "play_sound"})
	useful_devices = r.body[:get_active_devices_from_localization_response][:value] & r2.body[:get_active_devices_by_functionality_response][:value]
	device_name = client.call(:get_device_name, message: {"device_id" => useful_devices.last})
	device_name = device_name.body[:get_device_name_response][:value]
	operation = "play_sound_" + device_name
	new_client = Savon.client(wsdl: 'http://localhost:3000/web_service/wsdl?'+device_name)
	st_response = new_client.call(operation.to_sym, :message => {"device_id" => useful_devices.last, "sound" => "Base64.encode64(File.binread('/home/eduardo/workspace/sound.mp3')"})
	st_response.body["#{operation}_response".to_sym][:value] == "ok"
end


client = Savon.client(wsdl: 'http://localhost:3000/information/wsdl')

patient = nil
caregiver = nil
r = client.call(:get_people)
people = r.body[:get_people_response][:value]
people.each do |person|
	if person[:kind] == "Patient"
		patient = person
	elsif person[:kind] == "Caregiver"
		caregiver = person
	end
end

agitation_level = get_status_level("agitation", patient)
if agitation_level != "none"
	puts "Patient State is agitation"
	r = client.call(:notify_caregiver, message: {"caregiver_name" => caregiver[:name], "text" => "Patient state is agitation!"})
	if r.body[:notify_caregiver_response][:value] == "ok"
		puts "Caregiver was notified"
	end

	if caregiver[:location] == "not at home"
		puts "Caregiver is not at home"
		if agitation_level == "high"
			puts "Use of drugs informed to Patient" if inform_use_of_drugs(client, patient)
		end
		client.call(:call_for_organization, :message => {"organization_name" => "hospital"})
		puts "Hospital was called"
	

	else
		puts "Caregiver is at home"
		if agitation_level == "high"
			inform_use_of_drugs(client, caregiver)
			puts "Use of drugs informed Caregiver"
		end
	end
	puts "Patient is gettting calm" if calm_patient(client, patient) 
end
