class InformationController < ApplicationController
	include WashOut::SOAP
	before_action :check_if_simulation_was_started

	soap_action "call_for_organization", :args => {"organization_name" => :string}, :return => :integer
  def call_for_organization
   render_action and return if @error
    if params["organization_name"]
      @organization = Organization.find_by_name(params["organization_name"])
      if @organization
        unit = @organization.call
      	if unit 
          @result = "Success | #{unit.id}"
        else
          @error = "Organization was already called"
        end
      else
        @error = "Organization not found"
      end
    else
      @error = "organization_name was not passed"
    end
    render_action
  end

  soap_action "notify_caregiver", :args => { "caregiver_name" => :string, "text" => :string}, :return => :string
  def notify_caregiver
    person = Person.find_by_name(params["caregiver_name"])
    if person && person.kind== 'Caregiver'
      Log.create(:kind => 5, :description => "Caregiver #{person.name} was notified that: #{params['text']}")
      @result = "ok"
    else 
      @error =  "caregiver not found"
    end
    render_action  
  end

  soap_action "get_time_for_organization_arrival", :args => {"unit" => :integer}, :return => :string
  def get_time_for_organization_arrival
   render_action and return if @error
    if params["unit"]
      @organization = OrganizationCall.find_by_name(params["unit"]).organization
      if @organization
        @result = @organization.get_time_for_organization_arrival
      else
        @error = "Organization not found"
      end
    else
      @error = "organization_name was not passed"
    end
    render_action
  end

  soap_action "get_device_name", :args => {"device_id" => :integer}, :return => :string
  def get_device_name
    render_action and return if @error
    if params["device_id"]
      @result = DeviceRoom.find(params["device_id"]).device.name
    else
      @error = "device_id was not passed"
    end
    render_action
  end

  soap_action "get_localization_from_person", :args => {"person_name" => :string}, :return => :string
  def get_localization_from_person
    render_action and return if @error
    if params["person_name"]
      @result = Person.find_by_name(params["person_name"]).room.name
    else
      @error = "person_id was not passed"
    end
    render_action
  end

  soap_action "get_localization_from_device", :args => {"device_id" => :integer}, :return => :string
  def get_localization_from_device
    render_action and return if @error
    if params["device_id"]
      @result = DeviceRoom.find(params["device_id"]).room.name
    else
      @error = "device_id was not passed"
    end
    render_action
  end

  soap_action "get_active_devices_from_localization", :args => {"room_name" => :string}, :return => [:integer]
  def get_active_devices_from_localization
    render_action and return if @error
    if params["room_name"]
      room = Room.find_by_name(params["room_name"])
      if room
        @result = DeviceRoom.joins(:statuses).where("room_id=? and (statuses.name='active' and value = 'true')", room.id).map{|d| d.id }
      else
        @error = []
      end
    else
      @error = []
    end
    render_action
  end 

  soap_action "get_stuff_from_localization", :args => {"room_name" => :string}, :return => [:string]
  def get_stuff_from_localization
    render_action and return if @error
    if params["room_name"]
      room = Room.find_by_name(params["room_name"])
      if room
        @result = Stuff.where("room_id=?", room.id).map{|d| d.name }
      else
        @error = []
      end
    else
      @error = []
    end
    render_action
  end 

  soap_action "get_active_devices_by_functionality", :args => {"functionality" => :string}, :return => [:integer]
  def get_active_devices_by_functionality
    render_action and return if @error
    if params["functionality"]
      device_names = DeviceRoom.joins(:statuses).where("statuses.name='active' and value = 'true'").map {|dr| dr.device.name}
      device_names = device_names & DEVICES_BY_OPERATION[params["functionality"]]
      @result = DeviceRoom.joins(:device).where("name in (?) ", device_names).map{|dr| dr.id}
    else
      @error = []
    end
    render_action
  end  

  soap_action "get_devices_by_functionality", :args => {"functionality" => :string}, :return => [:integer]
  def get_devices_by_functionality
    render_action and return if @error
    @result = []
    if params["functionality"]
      @result = DEVICES_BY_OPERATION[params["functionality"]]
    else
      @error = "device_id was not passed"
    end
    render_action
  end  

  soap_action "get_rooms", :return => [:string]
  def get_rooms
    render_action and return if @error
    @result = Room.all.map{|r| r.name}
    render_action
  end  

  soap_action "get_people", :return => [PersonType]
  def get_people
     render :soap => [] and return if @error
    @result = Person.all.map {|p| p.get_data }
    render :soap => @result
  end

  soap_action "get_person_data", :args => {"person_name" => :string}, :return => PersonType
  def get_person_data
    render_action and return if @error
    if params["person_name"]
      @result = Person.find_by_name(params["person_name"]).get_data
    else
      @error = "person_name was not passed"
    end
    render_action
  end

  soap_action "get_status_device", :args => {"device_id" => :integer, "status" => :string}, :return => :string
  def get_status_device
    render_action and return if @error
    if params["device_id"] && params["status"]
      @result = DeviceRoom.find(params["device_id"]).get_status(params["status"])
    else
      @error = "device id or status was not passed"
    end
    render_action
  end

  

  def render_action
    if !@error
      render :soap => @result
    else
      if @error.is_a? String
        render :soap => "Error | #{@error}"
      else
        render :soap => @error
      end
    end
  end

  def check_if_simulation_was_started
    if !Simulation.started?
      @error = "Simulation must be started!"
      # raise SimulationNotStartedError
    end
  end
end

