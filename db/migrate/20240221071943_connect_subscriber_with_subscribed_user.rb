class ConnectSubscriberWithSubscribedUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :subscriptions, :subscriber
    add_reference :subscriptions, :subscribed_user
  end
end
