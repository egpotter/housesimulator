class CreateDisabilities < ActiveRecord::Migration
  def change
    create_table :disabilities do |t|
      t.string :name
      t.integer :level
      t.integer :person_id

      t.timestamps
    end
  end
end
