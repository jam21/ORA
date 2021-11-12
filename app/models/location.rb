class Location < ApplicationRecord
	self.table_name = :cust_ora_locations_t
	self.primary_key = :location_id
	
	has_many :plants
	has_many :areas, through: :plants
	has_many :nfc_tags, through: :plants
	has_many :assets, through: :plants
	has_many :checklists, through: :plants
	has_many :users
	
	def unsynced_data_by_date(last_data_sync_date, last_users_sync_date)

		last_data_sync_date='1-1-1900' if last_data_sync_date.nil?
		last_users_sync_date='1-1-1900' if last_users_sync_date.nil?				
		
		location_hash = self.attributes

		location_hash[:plants] = self.plants.where("#{Plant.table_name}.last_update_date>? AND #{Plant.table_name}.end_date IS NULL", last_data_sync_date)
		location_hash[:areas] = self.areas.where("#{Area.table_name}.last_update_date>? AND #{Area.table_name}.end_date IS NULL", last_data_sync_date)
		location_hash[:nfc_tags] = self.nfc_tags.where("#{NfcTag.table_name}.last_update_date>? AND #{NfcTag.table_name}.end_date IS NULL", last_data_sync_date)
		location_hash[:assets] = self.assets.where("#{Asset.table_name}.last_update_date>? AND #{Asset.table_name}.end_date IS NULL", last_data_sync_date)
		location_hash[:checklists] = self.checklists.where("#{Checklist.table_name}.last_update_date>? AND #{Checklist.table_name}.end_date IS NULL", last_data_sync_date)
		location_hash[:users] = self.users.where("#{User.table_name}.last_update_date>? AND #{User.table_name}.end_date IS NULL", last_users_sync_date)

		location_hash[:deleted_plants] = self.plants.where("#{Plant.table_name}.last_update_date>? AND #{Plant.table_name}.end_date IS NOT NULL", last_data_sync_date)
		location_hash[:deleted_areas] = self.areas.where("#{Area.table_name}.last_update_date>? AND #{Area.table_name}.end_date IS NOT NULL", last_data_sync_date)
		location_hash[:deleted_nfc_tags] = self.nfc_tags.where("#{NfcTag.table_name}.last_update_date>? AND #{NfcTag.table_name}.end_date IS NOT NULL", last_data_sync_date)
		location_hash[:deleted_assets] = self.assets.where("#{Asset.table_name}.last_update_date>? AND #{Asset.table_name}.end_date IS NOT NULL", last_data_sync_date)
		location_hash[:deleted_checklists] = self.checklists.where("#{Checklist.table_name}.last_update_date>? AND #{Checklist.table_name}.end_date IS NOT NULL", last_data_sync_date)
		location_hash[:deleted_users] = self.users.where("#{User.table_name}.last_update_date>? AND #{User.table_name}.end_date IS NOT NULL", last_users_sync_date)
		
		location_hash
	end
end
