class CreateSimulations < ActiveRecord::Migration
  def change
    create_table :simulations do |t|
      t.boolean :active
      
      t.timestamps
    end

  end
end
