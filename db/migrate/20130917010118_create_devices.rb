class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :deviceName
      t.string :status

      t.timestamps
    end
  end
end
