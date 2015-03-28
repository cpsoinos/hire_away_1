class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      flash[:alert] = "Event added!"
      redirect_to event_path(@event)
    else
      flash[:error] = "Uh-oh! #{@event.errors}"
      binding.pry
      redirect_to :back
    end
  end

  protected
  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :start_time,
      :end_time,
      :location_id)
  end
end
