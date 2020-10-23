class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.belongs_to :user
      t.datetime :event_time

      t.timestamps
    end
  end
end
