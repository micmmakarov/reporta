class AddCachedEventsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cached_events, :text
  end
end
