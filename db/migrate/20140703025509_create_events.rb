class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_id
      t.integer :occured_at
      t.string :source
      t.string :type
      t.string :data

      t.timestamps
    end
  end
end
