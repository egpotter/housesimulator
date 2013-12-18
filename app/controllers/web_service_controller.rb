class WebServiceController < ApplicationController
  include WashOut::SOAP
  before_action :check_if_simulation_was_started
  after_action :save_log, :except => [:_generate_wsdl]

  def save_log
    d = DeviceRoom.find(params["device_id"])
    Log.create(status: @error ? false : true, device_room_id: params["device_id"], kind:1, description: "ID:#{d.id} NAME:#{d.device.name} LOCATION:#{d.room.name} ACTION:#{action_name} #{@error ? 'error' : 'success'}")
  end

  ######## these are the actions defined in the.doc ########
  ### (the actions that changes the status from devices, such as turn on, turn of)########
   
  ### radio_clock ####

  soap_action "turn_on_radio_clock", :args => {"device_id" => :integer }, :return => :string
  def turn_on_radio_clock
    turn_on(params["device_id"])
  end

  soap_action "turn_off_radio_clock", :args => {"device_id" => :integer }, :return => :string
  def turn_off_radio_clock
    turn_off(params["device_id"])
  end


  soap_action "show_text_radio_clock", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_radio_clock
    show_text(params["device_id"])
  end

  soap_action "play_sound_radio_clock", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def play_sound_radio_clock
    play_sound(params["device_id"])
  end

  ### smart_wardrobe ####

  soap_action "turn_on_smart_wardrobe", :args => {"device_id" => :integer }, :return => :string
  def turn_on_smart_wardrobe
    turn_on(params["device_id"])
  end

  soap_action "turn_off_smart_wardrobe", :args => {"device_id" => :integer }, :return => :string
  def turn_off_smart_wardrobe
    turn_off(params["device_id"])
  end

  soap_action "show_text_smart_wardrobe", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_smart_wardrobe
    show_text(params["device_id"])
  end

  soap_action "show_image_smart_wardrobe", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def show_image_smart_wardrobe
    show_image(params["device_id"])
  end

  ### smart_pillow ###

  soap_action "turn_on_smart_pillow", :args => {"device_id" => :integer }, :return => :string
  def turn_on_smart_pillow
    turn_on(params["device_id"])
  end

  soap_action "turn_off_smart_pillow", :args => {"device_id" => :integer }, :return => :string
  def turn_off_smart_pillow
    turn_off(params["device_id"])
  end

  soap_action "show_text_smart_pillow", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_smart_pillow
    show_text(params["device_id"])
  end

  soap_action "show_image_smart_pillow", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def show_image_smart_pillow
    show_image(params["device_id"])
  end

  soap_action "play_sound_smart_pillow", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def play_sound_smart_pillow
    play_sound(params["device_id"])
  end

  soap_action "play_video_smart_pillow", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def play_video_smart_pillow
    play_video(params["device_id"])
  end

  ### smart_window ####

  soap_action "turn_on_smart_window", :args => {"device_id" => :integer }, :return => :string
  def turn_on_smart_window
    turn_on(params["device_id"])
  end

  soap_action "turn_off_smart_window", :args => {"device_id" => :integer }, :return => :string
  def turn_off_smart_window
    turn_off(params["device_id"])
  end

  soap_action "show_text_smart_window", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_smart_window
    show_text(params["device_id"])
  end

  soap_action "show_image_smart_window", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def show_image_smart_window
    show_image(params["device_id"])
  end

  ### curtain ###

  soap_action "open_curtain", :args => {"device_id" => :integer }, :return => :string
  def open_curtain
    open_curtain_or_window(params["device_id"])
  end  

  soap_action "open_halfway_curtain", :args => {"device_id" => :integer }, :return => :string
  def open_halfway_curtain
    open_halfway_curtain_or_window(params["device_id"])
  end  

  soap_action "close_curtain", :args => {"device_id" => :integer }, :return => :string
  def close_curtain
    close_curtain_or_window(params["device_id"])
  end  


  ### roof_light ###

  soap_action "turn_on_roof_light", :args => {"device_id" => :integer }, :return => :string
  def turn_on_roof_light
    turn_on(params["device_id"])
  end

  soap_action "turn_off_roof_light", :args => {"device_id" => :integer }, :return => :string
  def turn_off_roof_light
    turn_off(params["device_id"])
  end

  soap_action "set_intense_light_roof_light", :args => {"device_id" => :integer }, :return => :string
  def set_intense_light_roof_light
    set_intense_light(params["device_id"])
  end

  soap_action "set_dimmed_light_roof_light", :args => {"device_id" => :integer }, :return => :string
  def set_dimmed_light_roof_light
    set_dimmed_light(params["device_id"])
  end

  soap_action "set_pulsating_light_roof_light", :args => {"device_id" => :integer }, :return => :string
  def set_pulsating_light_roof_light
    set_pulsating_light(params["device_id"])
  end

  ### lamp ###

  soap_action "turn_on_lamp", :args => {"device_id" => :integer }, :return => :string
  def turn_on_lamp
    turn_on(params["device_id"])
  end

  soap_action "turn_off_lamp", :args => {"device_id" => :integer }, :return => :string
  def turn_off_lamp
    turn_off(params["device_id"])
  end

  soap_action "set_intense_light_lamp", :args => {"device_id" => :integer }, :return => :string
  def set_intense_light_lamp
    set_intense_light(params["device_id"])
  end

  soap_action "set_dimmed_light_lamp", :args => {"device_id" => :integer }, :return => :string
  def set_dimmed_light_lamp
    set_dimmed_light(params["device_id"])
  end

  soap_action "set_pulsating_light_lamp", :args => {"device_id" => :integer }, :return => :string
  def set_pulsating_light_lamp
    set_pulsating_light(params["device_id"])
  end

  ### mirror ###

  soap_action "turn_on_mirror", :args => {"device_id" => :integer }, :return => :string
  def turn_on_mirror
    turn_on(params["device_id"])
  end

  soap_action "turn_off_mirror", :args => {"device_id" => :integer }, :return => :string
  def turn_off_mirror
    turn_off(params["device_id"])
  end

  soap_action "show_text_mirror", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_mirror
    show_text(params["device_id"])
  end

  soap_action "show_image_mirror", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def show_image_mirror
    show_image(params["device_id"])
  end

  soap_action "set_zoom_in_mirror", :args => {"device_id" => :integer }, :return => :string
  def set_zoom_in_mirror
    set_zoom_in(params["device_id"])
  end

  soap_action "set_zoom_normal_mirror", :args => {"device_id" => :integer }, :return => :string
  def set_zoom_normal
    set_zoom_normal(params["device_id"])
  end

  soap_action "set_zoom_out_mirror", :args => {"device_id" => :integer }, :return => :string
  def set_zoom_out_mirror
    set_zoom_out(params["device_id"])
  end

  ### sprinkler ###

  soap_action "turn_on_sprinkler", :args => {"device_id" => :integer }, :return => :string
  def turn_on_sprinkler
    turn_on(params["device_id"])
  end

  soap_action "turn_off_sprinkler", :args => {"device_id" => :integer }, :return => :string
  def turn_off_sprinkler
    turn_off(params["device_id"])
  end

  ### door ###

  soap_action "open_door", :args => {"device_id" => :integer }, :return => :string
  def open_door
    open_door(params["device_id"])
  end

  soap_action "close_door", :args => {"device_id" => :integer }, :return => :string
  def close_door
    close_door(params["device_id"])
  end

  soap_action "lock_door", :args => {"device_id" => :integer }, :return => :string
  def lock_door
    lock(params["device_id"])
  end  

  soap_action "unlock_door", :args => {"device_id" => :integer }, :return => :string
  def unlock_door
    unlock(params["device_id"])
  end  

  ### computer_type_1 ###

   soap_action "turn_on_computer_type_1", :args => {"device_id" => :integer }, :return => :string
  def turn_on_computer_type_1
    turn_on(params["device_id"])
  end

  soap_action "turn_off_computer_type_1", :args => {"device_id" => :integer }, :return => :string
  def turn_off_computer_type_1
    turn_off(params["device_id"])
  end

  soap_action "show_text_computer_type_1", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_computer_type_1
    show_text(params["device_id"])
  end

  soap_action "show_image_computer_type_1", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def show_image_computer_type_1
    show_image(params["device_id"])
  end

  soap_action "play_sound_computer_type_1", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def play_sound_computer_type_1
    play_sound(params["device_id"])
  end

  soap_action "play_video_computer_type_1", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def play_video_computer_type_1
    play_video(params["device_id"])
  end

    ### computer_type_2 ###

   soap_action "turn_on_computer_type_2", :args => {"device_id" => :integer }, :return => :string
  def turn_on_computer_type_2
    turn_on(params["device_id"])
  end

  soap_action "turn_off_computer_type_2", :args => {"device_id" => :integer }, :return => :string
  def turn_off_computer_type_2
    turn_off(params["device_id"])
  end

  soap_action "show_text_computer_type_2", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_computer_type_2
    show_text(params["device_id"])
  end

  soap_action "show_image_computer_type_2", :args => {"device_id" => :integer, :image => :base64Binary }, :return => :string
  def show_image_computer_type_2
    show_image_blob(params["device_id"], params[:image])
  end

  soap_action "play_sound_computer_type_2", :args => {"device_id" => :integer, :sound => :base64Binary }, :return => :string
  def play_sound_computer_type_2
    play_sound_blob(params["device_id"])
  end

  soap_action "play_video_computer_type_2", :args => {"device_id" => :integer, :video => :base64Binary }, :return => :string
  def play_video_computer_type_2
    play_video_blob(params["device_id"])
  end

  ### agenda_type_1 ###

  soap_action "turn_on_agenda_type_1", :args => {"device_id" => :integer }, :return => :string
  def turn_on_agenda_type_1
    turn_on(params["device_id"])
  end

  soap_action "turn_off_agenda_type_1", :args => {"device_id" => :integer }, :return => :string
  def turn_off_agenda_type_1
    turn_off(params["device_id"])
  end

  soap_action "show_text_agenda_type_1", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_agenda_type_1
    show_text(params["device_id"])
  end

  soap_action "show_image_agenda_type_1", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def show_image_agenda_type_1
    show_image(params["device_id"])
  end

  soap_action "play_sound_agenda_type_1", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def play_sound_agenda_type_1
    play_sound(params["device_id"])
  end

  ### agenda_type_2 ###

  soap_action "turn_on_agenda_type_2", :args => {"device_id" => :integer }, :return => :string
  def turn_on_agenda_type_2
    turn_on(params["device_id"])
  end

  soap_action "turn_off_agenda_type_2", :args => {"device_id" => :integer }, :return => :string
  def turn_off_agenda_type_2
    turn_off(params["device_id"])
  end

  soap_action "show_text_agenda_type_2", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_agenda_type_2
    show_text(params["device_id"])
  end

  soap_action "show_image_agenda_type_2", :args => {"device_id" => :integer, :image => :base64Binary }, :return => :string
  def show_image_agenda_type_2
    show_image_blob(params["device_id"])
  end

  soap_action "play_sound_agenda_type_2", :args => {"device_id" => :integer, :sound => :base64Binary }, :return => :string
  def play_sound_agenda_type_2
    play_sound_blob(params["device_id"])
  end

  ### luminaire ###

  soap_action "turn_on_luminaire", :args => {"device_id" => :integer }, :return => :string
  def turn_on_luminaire
    turn_on(params["device_id"])
  end

  soap_action "turn_off_luminaire", :args => {"device_id" => :integer }, :return => :string
  def turn_off_luminaire
    turn_off(params["device_id"])
  end

  soap_action "set_intense_light_luminaire", :args => {"device_id" => :integer }, :return => :string
  def set_intense_light_luminaire
    set_intense_light(params["device_id"])
  end

  soap_action "set_dimmed_light_luminaire", :args => {"device_id" => :integer }, :return => :string
  def set_dimmed_light_luminaire
    set_dimmed_light(params["device_id"])
  end

  soap_action "set_pulsating_light_luminaire", :args => {"device_id" => :integer }, :return => :string
  def set_pulsating_light_luminaire
    set_pulsating_light(params["device_id"])
  end

  ### shower ###

  soap_action "turn_on_shower", :args => {"device_id" => :integer }, :return => :string
  def turn_on_shower
    turn_on(params["device_id"])
  end

  soap_action "turn_off_shower", :args => {"device_id" => :integer }, :return => :string
  def turn_off_shower
    turn_off(params["device_id"])
  end

  ### latrine ###

  soap_action "activate_water_latrine", :args => {"device_id" => :integer }, :return => :string
  def activate_water_latrine
    activate_water(params["device_id"])
  end

  soap_action "deactivate_water_latrine", :args => {"device_id" => :integer }, :return => :string
  def deactivate_water_latrine
    deactivate_water(params["device_id"])
  end

  ### tap  ###

  soap_action "open_tap", :args => {"device_id" => :integer }, :return => :string
  def open_tap
    open_tap(params["device_id"])
  end

  soap_action "close_tap", :args => {"device_id" => :integer }, :return => :string
  def close_tap
    close_tap(params["device_id"])
  end 

  ### microwave ###

  soap_action "turn_on_microwave", :args => {"device_id" => :integer }, :return => :string
  def turn_on_microwave
    turn_on(params["device_id"])
  end

  soap_action "turn_off_microwave", :args => {"device_id" => :integer }, :return => :string
  def turn_off_microwave
    turn_off(params["device_id"])
  end

  soap_action "show_text_microwave", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_microwave
    show_text(params["device_id"])
  end

  soap_action "play_sound_microwave", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def play_sound_microwave
    play_sound(params["device_id"])
  end

### smart_painting ####

  soap_action "turn_on_smart_painting", :args => {"device_id" => :integer }, :return => :string
  def turn_on_smart_painting
    turn_on(params["device_id"])
  end

  soap_action "turn_off_smart_painting", :args => {"device_id" => :integer }, :return => :string
  def turn_off_smart_painting
    turn_off(params["device_id"])
  end

  soap_action "show_text_smart_painting", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_smart_painting
    show_text(params["device_id"])
  end

  soap_action "show_image_smart_painting", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def show_image_smart_painting
    show_image(params["device_id"])
  end

  ### stove ###

  soap_action "turn_on_stove", :args => {"device_id" => :integer }, :return => :string
  def turn_on_stove
    turn_on(params["device_id"])
  end

  soap_action "turn_off_stove", :args => {"device_id" => :integer }, :return => :string
  def turn_off_stove
    turn_off(params["device_id"])
  end

  ### oven ###

  soap_action "turn_on_oven", :args => {"device_id" => :integer }, :return => :string
  def turn_on_oven
    turn_on(params["device_id"])
  end

  soap_action "turn_off_oven", :args => {"device_id" => :integer }, :return => :string
  def turn_off_oven
    turn_off(params["device_id"])
  end

  ### smart_refrigerator ###

  soap_action "turn_on_smart_refrigerator", :args => {"device_id" => :integer }, :return => :string
  def turn_on_smart_refrigerator
    turn_on(params["device_id"])
  end

  soap_action "turn_off_smart_refrigerator", :args => {"device_id" => :integer }, :return => :string
  def turn_off_smart_refrigerator
    turn_off(params["device_id"])
  end

  soap_action "show_text_smart_refrigerator", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_smart_refrigerator
    show_text(params["device_id"])
  end

  soap_action "show_image_smart_refrigerator", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def show_image_smart_refrigerator
    show_image(params["device_id"])
  end

  soap_action "play_sound_smart_refrigerator", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def play_sound_smart_refrigerator
    play_sound(params["device_id"])
  end

  ### exhauster ###

  soap_action "turn_on_exhauster", :args => {"device_id" => :integer }, :return => :string
  def turn_on_exhauster
    turn_on(params["device_id"])
  end

  soap_action "turn_off_exhauster", :args => {"device_id" => :integer }, :return => :string
  def turn_off_exhauster
    turn_off(params["device_id"])
  end

  ### wash_machine ###

  soap_action "turn_on_wash_machine", :args => {"device_id" => :integer }, :return => :string
  def turn_on_wash_machine
    turn_on(params["device_id"])
  end

  soap_action "turn_off_wash_machine", :args => {"device_id" => :integer }, :return => :string
  def turn_off_wash_machine
    turn_off(params["device_id"])
  end

  ### gas_controller ###

  soap_action "open_valve_gas_controller", :args => {"device_id" => :integer }, :return => :string
  def open_valve_gas_controller
    if DeviceRoom.find(params["device_id"]).open_valve
      @result = "ok"
    else 
      @error = "pre conditions error"
    end
    render_action
  end

  soap_action "close_valve_gas_controller", :args => {"device_id" => :integer }, :return => :string
  def close_valve_gas_controller
    if DeviceRoom.find(params["device_id"]).close_valve
      @result = "ok"
    else 
      @error = "pre conditions error"
    end
    render_action
  end  

  ### eletronic_photo_album ###

  soap_action "turn_on_eletronic_photo_album", :args => {"device_id" => :integer }, :return => :string
  def turn_on_eletronic_photo_album
    turn_on(params["device_id"])
  end

  soap_action "turn_off_eletronic_photo_album", :args => {"device_id" => :integer }, :return => :string
  def turn_off_eletronic_photo_album
    turn_off(params["device_id"])
  end

  soap_action "show_text_eletronic_photo_album", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_eletronic_photo_album
    show_text(params["device_id"])
  end

  soap_action "show_image_eletronic_photo_album", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def show_image_eletronic_photo_album
    show_image(params["device_id"])
  end

  soap_action "play_sound_eletronic_photo_album", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def play_sound_eletronic_photo_album
    play_sound(params["device_id"])
  end

  ### watch ###

  soap_action "turn_on_watch", :args => {"device_id" => :integer }, :return => :string
  def turn_on_watch
    turn_on(params["device_id"])
  end

  soap_action "turn_off_watch", :args => {"device_id" => :integer }, :return => :string
  def turn_off_watch
    turn_off(params["device_id"])
  end

  soap_action "show_text_watch", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_watch
    show_text(params["device_id"])
  end

  soap_action "play_sound_watch", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def play_sound_watch
    play_sound(params["device_id"])
  end

  ### television_type_1 ###

  soap_action "turn_on_television_type_1", :args => {"device_id" => :integer }, :return => :string
  def turn_on_television_type_1
    turn_on(params["device_id"])
  end

  soap_action "turn_off_television_type_1", :args => {"device_id" => :integer }, :return => :string
  def turn_off_television_type_1
    turn_off(params["device_id"])
  end

  soap_action "show_text_television_type_1", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_television_type_1
    show_text(params["device_id"])
  end

  soap_action "show_image_television_type_1", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def show_image_television_type_1
    show_image(params["device_id"])
  end

  soap_action "play_sound_television_type_1", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def play_sound_television_type_1
    play_sound(params["device_id"])
  end

  soap_action "play_video_television_type_1", :args => {"device_id" => :integer, :url => :string }, :return => :string
  def play_video_television_type_1
    play_video(params["device_id"])
  end

  ### television_type_2 ###

  soap_action "turn_on_television_type_2", :args => {"device_id" => :integer }, :return => :string
  def turn_on_television_type_2
    turn_on(params["device_id"])
  end

  soap_action "turn_off_television_type_2", :args => {"device_id" => :integer }, :return => :string
  def turn_off_television_type_2
    turn_off(params["device_id"])
  end

  soap_action "show_text_television_type_2", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_television_type_2
    show_text(params["device_id"])
  end

  soap_action "show_image_television_type_2", :args => {"device_id" => :integer, :image => :base64Binary }, :return => :string
  def show_image_television_type_2
    show_image_blob(params["device_id"])
  end

  soap_action "play_sound_television_type_2", :args => {"device_id" => :integer, :sound => :base64Binary }, :return => :string
  def play_sound_television_type_2
    play_sound_blob(params["device_id"])
  end

  soap_action "play_video_television_type_2", :args => {"device_id" => :integer, :video => :base64Binary }, :return => :string
  def play_video_television_type_2
    play_video_blob(params["device_id"])
  end

  ### mobile_phone ###

  soap_action "turn_on_mobile_phone", :args => {"device_id" => :integer }, :return => :string
  def turn_on_mobile_phone
    turn_on(params["device_id"])
  end

  soap_action "turn_off_mobile_phone", :args => {"device_id" => :integer }, :return => :string
  def turn_off_mobile_phone
    turn_off(params["device_id"])
  end

  soap_action "show_text_mobile_phone", :args => {"device_id" => :integer, :text => :string }, :return => :string
  def show_text_mobile_phone
    show_text(params["device_id"])
  end

  soap_action "show_image_mobile_phone", :args => {"device_id" => :integer, :image => :base64Binary }, :return => :string
  def show_image_mobile_phone
    show_image_blob(params["device_id"])
  end

  soap_action "play_sound_mobile_phone", :args => {"device_id" => :integer, :sound => :base64Binary }, :return => :string
  def play_sound_mobile_phone
    play_sound_blob(params["device_id"])
  end

  soap_action "play_video_mobile_phone", :args => {"device_id" => :integer, :video => :base64Binary }, :return => :string
  def play_video_mobile_phone
    play_video_blob(params["device_id"])
  end

  ##### devices list ends here #####
  def render_action
    if !@error
      render :soap => @result
    else
      render :soap => @error
    end
  end
  ### private methods ###
  private
  
  def turn_on(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.turn_on
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def turn_off(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.turn_off
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def show_text(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.show_text(params[:text])
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def show_image_blob(device_id, image)
     if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.show_image("")
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def show_image(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.show_image(params[:url])
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def play_video_blob(device_id, video)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.play_video("")
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def play_video(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.play_video(params[:url])
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def play_sound_blob(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.play_sound("")
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def play_sound(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.play_sound(params[:url])
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def open_curtain_or_window(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.open_curtain
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end  

  def open_halfway_curtain_or_window(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.open_halfway_curtain
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end  

  def close_curtain_or_window(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.close_curtain
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end 

  def set_intense_light(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.set_intense_light
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def set_dimmed_light(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.set_dimmed_light
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def set_pulsating_light(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.set_pulsating_light
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end 

  def set_zoom_in(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.set_zoom_in
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def set_zoom_normal(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.set_zoom_normal
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def set_zoom_out(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.set_zoom_out
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def open_door(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.open_door
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def close_door(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.close_door
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def lock(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.lock
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def unlock(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.unlock
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def activate_water(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.activate_water
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def deactivate_water(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.deactivate_water
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def open_tap(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.open_tap
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def close_tap(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.close_tap
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end 

  def open_valve(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.open_valve
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end

  def close_valve(device_id)
    if @device = DeviceRoom.find(device_id)
      if action_name.include? @device.device.name
        if @device.close_valve
          @result = "ok"
        else
          @error = "pre conditions dont match"
        end
      else
        @error = "wrong equipment"
      end
    else 
      @error = "unable to find device"
    end
    render_action
  end  

  class SimulationNotStartedError < StandardError
  end

  def check_if_simulation_was_started
    if !Simulation.started?
      @error = "Simulation must be started!"
      # raise SimulationNotStartedError
    end
  end
end