class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # change to all upcoming events
    @events = Event.all
  end

  def show

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    @event.creator_id = current_user.id

    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :adress, :starts_at, :ends_at)
  end

end