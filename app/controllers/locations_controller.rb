class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
  end

  protected
  def location_params
    params.require(:location).permit(
      :name, :address, :city, :state,
      :contact_name, :contact_phone,
      :contact_email,
      :event_id
      )
end
