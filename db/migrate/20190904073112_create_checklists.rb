class CreateChecklists < ActiveRecord::Migration[6.0]
  def change
    create_table :cust_ora_checklists_t, primary_key: :checklist_id do |t|
      t.integer :area_id, null: false
      t.integer :seq_number
      t.string :check_list_description, limit: 100, null: false
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
      t.index [:area_id, :check_list_description, :unit_of_measure], unique: true
    end
  end
end
