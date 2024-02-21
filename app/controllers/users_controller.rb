class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :define_user_events, only: [:show]
  before_action :current_user_subscribed?, only: [:show]
  before_action :find_subscribers, only: [:show]

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

  def current_user_subscribed?
    @subscribed = Subscription.where(subscribed_user_id: params[:id], subscriber_id: current_user.id) == []
  end

  def find_subscribers
    @subscribers = User.find(params[:id]).subscribed_users
  end
end
