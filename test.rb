require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'http://localhost:3000/web_service/wsdl')

puts client.operations
# => [:find_user, :list_users]

# call the 'findUser' operation
response = client.call(:turn_off_television)
response = client.call(:turn_on, message: {device_id: 1})
response = client.call(:turn_on_radio_clock, message: {"device_id" => 40})
r = c.call(:call_for_organization, :message => {"organization_name" => "police"})
r = c.call(:show_image_computer, :message => {"device_id" => 49, :image => Base64.encode64(File.binread('/home/eduardo/Downloads/basquete.jpg'))})



puts response.body

### implementation of agitation scenario

	## notifies carigiver - how to do it?
	## aknowledge and provides assistance - how to do it?
	### where if caregiver at:
	client.call(:get_peopole) #iterate and find caregiver
	client.call(:get_localization_form_person)
	#### if carregiver at home
		###verify agitation level
		client.call(:get_person_data) #get person data for the pacient
		## if high
			##inform use of drugs caregiver - how to do it?
		### if intermediate / low 
			## calms patient - how to do it? (shot iamge, text, video?)

	### if not at home
		###verify agitation level
		client.call(:get_person_data) #get person data for the pacient
		## if high
			##inform use of drugs patient - how to do it?
		### if intermediate / low 
			## calms patient - how to do it? (shot iamge, text, video?)
	### requisita ambos, tanto health care provider como verifica?

####