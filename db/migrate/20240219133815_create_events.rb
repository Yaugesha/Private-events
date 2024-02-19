class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :adress
      t.date :starts_at
      t.date :ends_at

      t.timestamps
    end
  end
end
