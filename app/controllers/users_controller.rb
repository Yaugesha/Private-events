class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :define_user_events, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  private

  def define_user_events
    @feauture_events = current_user.events.where("starts_at > ?", DateTime.now)
    @past_events = current_user.events.where("ends_at < ?", DateTime.now)
    @current_events_attandencee = Event.where("ends_at > ?", DateTime.now)
                               .and(Event.where("starts_at < ?", DateTime.now))
                               .joins(:event_attendencees)
                               .where("attendencee_id = ?", params[:id])
    @prev_events_attandencee = Event.where("ends_at < ?", DateTime.now)
                               .joins(:event_attendencees)
                               .where("attendencee_id = ?", params[:id])
    @feaut_events_attandencee = Event.where("starts_at > ?", DateTime.now)
                               .joins(:event_attendencees)
                               .where("attendencee_id = ?", params[:id])
  end
end
