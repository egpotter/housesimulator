class AddStatusToOrganization < ActiveRecord::Migration
  def change
  	add_column :organizations, :status, :integer 
  	add_column :organization_calls, :status, :integer
  end
end
