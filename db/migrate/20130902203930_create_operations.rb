class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :wsdl_url
      t.string :description
      t.timestamps
    end
  end
end
