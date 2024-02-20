class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendencees

  validates :name, presence: true
  validates :description, presence: true
  validates :adress, presence: true
  validates :starts_at, comparison: { greater_than: DateTime.now,
                                      message: "can't be earlier then today date" }
  validates :ends_at, comparison: { greater_than: :starts_at ,
                                    message: "can't be earlier then start date" }
end
