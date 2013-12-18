class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :description
      t.string :value
	  t.integer :device_room_id
	  t.string :name

      t.timestamps
    end
  end
end
