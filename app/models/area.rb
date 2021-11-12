class Area < ApplicationRecord
	self.table_name = :cust_ora_areas_t
	self.primary_key = :area_id
	belongs_to :plant
	has_one :nfc_tag
	has_many :assets
	has_many :checklists
end
