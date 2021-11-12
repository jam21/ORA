class CreateAssetLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :cust_ora_asset_log_details_t, primary_key: :log_id do |t|
      t.integer :log_header_id, null: false
      t.integer :asset_id, null: false      
      t.decimal :current_value, null: false
      t.boolean :mwr_required
      t.string :mwr_justification, limit: 255
      t.string :remarks, limit: 255
      t.integer :created_by
      t.datetime :creation_date
      t.integer :last_updated_by
      t.datetime :last_update_date
      t.integer :last_update_login
      t.index [:asset_id, :current_value]      
    end
  end
end
