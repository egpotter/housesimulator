class CreateOrganizationCalls < ActiveRecord::Migration
  def change
    create_table :organization_calls do |t|
      t.integer :call_duration
      t.integer :organization_id

      t.timestamps
    end
  end
end
