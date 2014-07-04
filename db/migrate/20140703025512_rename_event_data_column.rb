class RenameEventDataColumn < ActiveRecord::Migration
  def self.up
        rename_column :cb_events, :data, :event_data
    end 
    def self.down
        rename_column :cb_events, :event_data, :data
    end
end
