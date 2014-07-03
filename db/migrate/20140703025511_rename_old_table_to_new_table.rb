class RenameOldTableToNewTable < ActiveRecord::Migration
  def self.up
        rename_table :events, :cb_events
        rename_column :cb_events, :type, :event_type
    end 
    def self.down
        rename_table :cb_events, :events
        rename_column :events, :event_type, :type
    end
end
