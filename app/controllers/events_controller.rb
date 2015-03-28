class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page])
  end

  def new
    @event = Event.new
    @locations = Location.all
    @location = Location.new
  end

  def create
    # @company = Company.new(params[:company])
    # @company.company_name = params[:new_company_name] unless params[:new_company_name].empty?
    @event = Event.create(event_params)
    if @event.save
      flash[:alert] = "Event added!"
      redirect_to event_path(@event)
    else
      render :action=>'new'
    end
  end

  protected
  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :start_time,
      :end_time,
      :location_id
      )
  end
end
