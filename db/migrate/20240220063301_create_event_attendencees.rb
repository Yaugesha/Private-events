class CreateEventAttendencees < ActiveRecord::Migration[7.1]
  def change
    create_table :event_attendencees do |t|
      t.belongs_to :attendencee
      t.belongs_to :event
      t.timestamps
    end
  end
end
