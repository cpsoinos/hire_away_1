class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page])
  end

  def show
    @event = Event.find(params[:id])
    @map_params = "#{@event.location.address}+#{@event.location.city}+#{@event.location.state}".gsub(/ /, "+")
    binding.pry
  end

  def new
    @event = Event.new
    @locations = Location.all
  end

  def create
    @locations = Location.all
    @location = Location.find_by(params[:location_id])
    @event = @location.events.new(event_params)
    binding.pry
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
      :end_time
      )
  end
end
