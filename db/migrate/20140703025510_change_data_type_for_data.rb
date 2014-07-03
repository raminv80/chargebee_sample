class ChangeDataTypeForData < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.change :data, :text
    end
  end
  def self.down
    change_table :events do |t|
      t.change :data, :string
    end
  end
end
