class CreateAssetLogHeaders < ActiveRecord::Migration[6.0]
  def change
    create_table :cust_ora_asset_log_headers_t, primary_key: :log_header_id do |t|
      t.integer :area_id, null: false
      t.string :shift, limit: 25, null: false
      t.string :comments, limit: 2000
      t.string :comments_01, limit: 2000
      t.boolean :log_required, null: false
      t.datetime :log_date, null: false
      t.decimal :latitude
      t.decimal :longitude
      t.integer :created_by
      t.datetime :creation_date
      t.integer :last_updated_by
      t.datetime :last_update_date
      t.integer :last_update_login
      t.index [:area_id, :shift, :log_date]      
    end
  end
end
