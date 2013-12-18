class AddPersonId < ActiveRecord::Migration
  def change
  	add_column :statuses, :person_id, :integer
  end
end
