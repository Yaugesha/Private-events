class Subscription < ApplicationRecord
  belongs_to :subscriber, class_name: "User"
  belongs_to :subscribed_user, class_name: "User"
end
