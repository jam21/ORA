class Asset < ApplicationRecord
	self.table_name = :cust_ora_assets_t
	self.primary_key = :asset_id
	belongs_to :area
	has_many :asset_logs
end
