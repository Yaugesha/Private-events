class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, class_name: 'Event', foreign_key: 'creator_id', dependent: :destroy
  has_many :event_attendencees, class_name: "EventAttendencee", foreign_key: "attendencee_id", dependent: :destroy

  validates :username, length: {minimum:4, maximum:10}
end
