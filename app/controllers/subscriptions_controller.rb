class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :define_users
  before_action :user_subscribed?, only: [:create]
  def index
    @subscription = Subscription.where(subscribed_user_id: @subscribed_user.id)
  end

  def create
    subscription = Subscription.new(subscribed_user_id: @subscribed_user.id, subscriber_id: @user.id)

    if subscription.save
      flash.now[:success]="You subribed to #{@subscribed_user.username}"
    end
  end

  def destroy
     Subscription.where(subscribed_user_id: @subscribed_user.id, subscriber_id: @user.id).first.delete
  end

  private

  def define_users
    @user = User.find(current_user.id)
    @subscribed_user = User.find(params[:user_id])
  end

  def user_subscribed?
    unless Subscription.where(subscribed_user_id: @subscribed_user.id, subscriber_id: @user.id) == []
      flash[:error]="You can't subscribe for the same user twice!"
      render template: "user/#{@user.id}"
    end
  end
end
