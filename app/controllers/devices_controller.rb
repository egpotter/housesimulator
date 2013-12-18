class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy, :conditions]

  def conditions
    
  end

  def update_status
    @status = Status.find(params[:id])
    @status.update_attribute(:value, params[:value])
  end

  def edit_device_room
    @device_room = DeviceRoom.find(params[:device_room_id])
  end

  def update_device_room
    @device_room = DeviceRoom.find(params[:device_room_id])
    @device_room.update_attributes(device_room_params)
    puts device_room_params
  end

  def index
    @devices = Device.all
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render action: 'show', status: :created, location: @device }
      else
        format.html { render action: 'new' }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:name, :statuses_attributes => {})
    end

    def device_room_params
      params.require(:device_room).permit(:name, :room_id, statuses_attributes: [:value, :id ])
    end

end
