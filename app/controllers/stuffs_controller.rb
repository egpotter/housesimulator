class StuffsController < ApplicationController
  before_action :set_stuff, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  # GET /stuffs
  # GET /stuffs.json


  def index
    @stuffs = Stuff.all
    @stuff = Stuff.new
  end

  # POST /stuffs
  # POST /stuffs.json
  def create
    @stuff = Stuff.new(stuff_params)
    @stuffs = Stuff.all
    respond_to do |format|
      if @stuff.save
        format.js { render :index }
      else
        format.json { respond_with_bip(@stuff) }
      end
    end
  end

  # PATCH/PUT /stuffs/1
  # PATCH/PUT /stuffs/1.json
  def update
    @stuff.update_attributes(stuff_params)
    respond_to do |format|
      format.json { respond_with_bip(@stuff) }
    end
    # respond_with @stuff
  end

  # DELETE /stuffs/1
  # DELETE /stuffs/1.json
  def destroy
    @stuff.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stuff
      @stuff = Stuff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stuff_params
      params.require(:stuff).permit(:name, :room_id)
    end
end
