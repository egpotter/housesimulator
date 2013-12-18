class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :type
      t.integer :room_id

      t.timestamps
    end
  end
end
