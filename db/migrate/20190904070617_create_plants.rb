class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :cust_ora_plants_t, primary_key: :plant_id do |t|
      t.integer :location_id, null: false
      t.string :plant_name, limit: 25, null: false
      t.integer :created_by
      t.datetime :creation_date
      t.integer :last_updated_by
      t.datetime :last_update_date
      t.integer :last_update_login
      t.datetime :end_date
      t.index [:location_id, :plant_name], unique: true
    end
  end
end
