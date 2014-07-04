class RenamesEventColumns < ActiveRecord::Migration
  def change
  	rename_column :cb_events, :source, :event_source
  	rename_column :cb_events, :occured_at, :event_occured_at
  end
end
