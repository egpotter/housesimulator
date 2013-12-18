class CreateDeviceRooms < ActiveRecord::Migration
  def change
    create_table :device_rooms do |t|
      t.integer :room_id
      t.integer :device_id

      t.timestamps
    end
  end
end
