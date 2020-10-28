class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.belongs_to :creator, foreign_key: { to_table: :users }, index: true, null: false
      t.datetime :event_time

      t.timestamps
    end
  end
end
