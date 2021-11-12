class CreateNfcTags < ActiveRecord::Migration[6.0]
  def change
    create_table :cust_ora_nfc_tags_t, primary_key: :nfc_tag_id do |t|
      t.integer :area_id, null: false
      t.string :nfc_tag_value, limit: 100, null: false
      t.datetime :nfc_tag_expiry
      t.integer :nfc_tag_type, null: false
      t.string :remarks, limit: 255
      t.integer :created_by
      t.datetime :creation_date
      t.integer :last_updated_by
      t.datetime :last_update_date
      t.integer :last_update_login
      t.datetime :end_date
      t.index [:area_id, :nfc_tag_value, :nfc_tag_type], unique: true
    end
  end
end
