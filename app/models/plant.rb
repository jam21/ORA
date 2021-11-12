class Plant < ApplicationRecord
	self.table_name = :plants_t
	self.primary_key = :plant_id
	belongs_to :location
	has_many :areas
	has_many :nfc_tags, through: :areas
	has_many :assets, through: :areas
	has_many :checklists, through: :areas

	has_many :users

	scope :unsynced,->(last_sync_date){
		last_sync_date='1-1-1900' if last_sync_date.nil?
		where("last_update_date>?",last_sync_date)
	}
	
end
