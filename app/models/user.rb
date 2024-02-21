class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, class_name: 'Event', foreign_key: 'creator_id', dependent: :destroy
  has_many :event_attendencees, class_name: "EventAttendencee", foreign_key: "attendencee_id", dependent: :destroy

  has_many :subscriptions_as_subscriber, class_name: "Subscription", foreign_key: "subscriber_id", dependent: :destroy
  has_many :subscriptions_as_subscribed_user, class_name: "Subscription", foreign_key: "subscribed_user_id", dependent: :destroy

  has_many :subscribers, through: :subscriptions_as_subscribed_user
  has_many :subscribed_users, through: :subscriptions_as_subscriber

  validates :username, length: {minimum:4, maximum:10}

  scope :subscribed_users, ->(user_id) {where(id: user_id).joins(:subscriptions_as_subscriber).select(:subscribed_user_id)}

end
