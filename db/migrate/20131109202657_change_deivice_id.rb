class ChangeDeiviceId < ActiveRecord::Migration
  def change
  	rename_column :logs, :device_id, :device_room_id
  end
end
