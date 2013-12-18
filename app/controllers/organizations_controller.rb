class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  # GET /organizations
  # GET /organizations.json


  def index
    @organizations = Organization.all
    @organization = Organization.new
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)
    @organizations = Organization.all
    respond_to do |format|
      if @organization.save
        format.js { render :index }
      else
        format.json { respond_with_bip(@organization) }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    @organization.update_attributes(organization_params)
    respond_to do |format|
      format.json { respond_with_bip(@organization) }
    end
    # respond_with @organization
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name)
    end
end
