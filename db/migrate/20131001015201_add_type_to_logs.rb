class AddTypeToLogs < ActiveRecord::Migration
  def change
  	add_column :logs, :kind, :integer, :default => 1
  	add_column :logs, :url, :string
  	add_column :devices, :busy, :boolean, :default => false
  end
end
