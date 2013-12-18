class ChangeColumns < ActiveRecord::Migration
  def change
  	remove_column :logs, :new_status, :string
  	remove_column :logs, :old_status, :string
  	add_column :logs, :status, :boolean
  end
end
