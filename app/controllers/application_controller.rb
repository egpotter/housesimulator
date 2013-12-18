class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def reload
    # Person.update_locations
    DeviceRoom.update_statuses
    @device_rooms = DeviceRoom.get_last_changed
    @logs = Log.where("created_at > ? and kind !=2 and kind !=3", Simulation.last.created_at)
  end

  def log
  	@logs = Log.all
  end

  def simulation
  	@simulation = Simulation.last
    @devices = Device.all if !@simulation.active
  end

  def submit_simulation
  	if params[:simulation_id] 
  			@simulation = Simulation.find(params[:simulation_id]) 
  			@simulation.active = false
  			@simulation.save
  		  @devices = Device.all
      else
  			@simulation = Simulation.create(active: true)
        Device.set_active_devices(params[:device_ids])
  	end
  	render :simulation
  end

  def manage_simulation
    if Simulation.started?
      Simulation.last.finish
    else  
      Simulation.create(active: true)
    end
    redirect_to root_path
  end

  def edit_person
    @person = Person.find(params[:person_id])
  end

  def update_person
    @person = Person.find(params[:person_id])
    @person.update_attributes(person_params)
    
  end

  private

  def person_params
    params.require(:person).permit(:room_id, :kind, :name,  disabilities_attributes: [:id, :name, :level, :_destroy], statuses_attributes: [:value, :id ])
  end

  protect_from_forgery with: :exception
end
