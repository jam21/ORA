class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :cust_ora_areas_t, primary_key: :area_id do |t|
      t.integer :plant_id, null: false
      t.string :area_name, limit: 25, null: false
      t.integer :parent_area_id
      t.integer :created_by
      t.datetime :creation_date
      t.integer :last_updated_by
      t.datetime :last_update_date      
      t.integer :last_update_login
      t.datetime :end_date
      t.index [:plant_id, :area_name, :parent_area_id], unique: true
    end
  end
end
