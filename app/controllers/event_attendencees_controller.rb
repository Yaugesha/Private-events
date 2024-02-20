class EventAttendenceesController < ApplicationController
before_action :authenticate_user!
before_action :set_event

def new
  @atendencee = EventAttendencee.new
end


def create
  @attendencee = EventAttendencee.new(event_id: @event.id, attendencee_id: current_user.id)

  if @attendencee.save
    redirect_to event_path(@event)
  else
    render :new, status: :unprocessable_entity
  end
end

private

 def set_event
    @event = Event.find(params[:event_id])
  end
end
