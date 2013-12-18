class AddColumnViewed < ActiveRecord::Migration
  def change
  	add_column :logs, :viewed, :boolean, :default => false
  end
end
