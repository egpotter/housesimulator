class ChangePersonTable < ActiveRecord::Migration
  def change
  	remove_column :people, :type
  	add_column :people, :name, :string
  	add_column :people, :kind, :string
  	add_column :people, :age, :integer
  end
end
