class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :cust_ora_users_t, primary_key: :user_id do |t|
      t.string :user_name, limit: 25, null: false
      t.integer :user_pin
      t.integer :location_id, null: false
      t.integer :plant_id
      t.integer :created_by
      t.datetime :creation_date
      t.integer :last_updated_by
      t.datetime :last_update_date      
      t.integer :last_update_login
      t.datetime :end_date
      t.index [:user_name, :location_id], unique: true

    end
  end
end
