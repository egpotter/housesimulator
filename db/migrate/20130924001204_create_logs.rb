class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :new_status
      t.string :old_status
      t.integer :device_id
      t.string :description

      t.timestamps
    end
  end
end
