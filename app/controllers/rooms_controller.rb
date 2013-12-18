class RoomsController < ApplicationController
  before_action :set_room, only: [:update, :destroy, :add_device]
  respond_to :html, :json
  before_action :set_simulation, except: [:index]

  # GET /rooms
  # GET /rooms.json
  def index
    @logs = Log.where("created_at > ? and kind !=2 and kind !=3", Simulation.last ? Simulation.last.created_at : Time.now)
    @rooms = Room.all
    @room = Room.new
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    @rooms = Room.all
    respond_to do |format|
      if @room.save
        format.js { render :index }
      else
        format.json { respond_with_bip(@room) }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    @room.update_attributes(room_params)
    respond_to do |format|
      format.json { respond_with_bip(@room) }
    end
    # respond_with @room
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
  end

  def add_device
    @device = Device.find(params[:device_id])
    @device_room = @room.add_device(@device.id)
    respond_to do |format|
      format.js { render :add_device }
    end
  end

  def delete_device
    @device_room = DeviceRoom.find(params[:device_room_id])
    @device_room.destroy
  end

  def add_person
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.js 
      else
        format.json { respond_with_bip(@person) }
      end
    end
  end

  def delete_person
    @person = Person.find(params[:person_id])
    @person.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name)
    end

    def person_params
      params.require(:person).permit(:room_id, :kind, :name,  disabilities_attributes: [:id, :name, :level, :_destroy], statuses_attributes: [:value, :id ])
    end

    def set_simulation
      @simulation = Simulation.last
      if Simulation.started?
        redirect_to rooms_path
      end
    end
end
