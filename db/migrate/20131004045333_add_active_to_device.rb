class AddActiveToDevice < ActiveRecord::Migration
  def change
  	add_column :devices, :active, :boolean, :default => true
  end
end
