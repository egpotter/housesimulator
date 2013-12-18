class ChangeDeviceColumn < ActiveRecord::Migration
  def change
  	rename_column :devices, "deviceName", :name
  end
end
