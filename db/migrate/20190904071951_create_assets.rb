class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :cust_ora_assets_t, primary_key: :asset_id do |t|
      t.integer :area_id, null: false
      t.integer :seq_number
      t.string :eam_asset_number, limit: 30, null: false
      t.string :asset_tag, limit: 25, null: false
      t.string :asset_description, limit: 100
      t.decimal :min_value
      t.decimal :max_value
      t.string :unit_of_measure, limit: 25, null: false
      t.boolean :is_boolean
      t.string :remarks, limit: 255
      t.integer :created_by
      t.datetime :creation_date
      t.integer :last_updated_by
      t.datetime :last_update_date
      t.integer :last_update_login
      t.datetime :end_date
      t.index [:area_id, :eam_asset_number, :asset_tag, :unit_of_measure], unique: true
    end
  end
end
