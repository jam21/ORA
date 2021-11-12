class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :cust_ora_locations_t, primary_key: :location_id do |t|      
      t.string :location_name, limit: 25, null: false
      t.string :location_description, limit: 255
      t.integer :created_by
      t.datetime :creation_date
      t.integer :last_updated_by
      t.datetime :last_update_date
      t.integer :last_update_login
      t.datetime :end_date
      t.index :location_name, unique: true
    end
  end
end
