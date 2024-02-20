class EventAttendencee < ApplicationRecord
  belongs_to :attendencee, class_name: "User"
  belongs_to :event
end
