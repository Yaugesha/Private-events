class FeedController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.where(creator_id: [ User.subscribed_users(current_user.id)])
    p @events
  end

end
