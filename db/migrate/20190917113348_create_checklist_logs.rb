class CreateChecklistLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :cust_ora_cklist_log_details_t, primary_key: :cklist_log_id do |t|
      t.integer :cklist_log_header_id, null: false
      t.integer :checklist_id, null: false
      t.decimal :current_value, null: false
      t.integer :created_by
      t.datetime :creation_date
      t.integer :last_updated_by
      t.datetime :last_update_date
      t.integer :last_update_login  
      t.index [:checklist_id, :current_value]    
    end
  end
end
