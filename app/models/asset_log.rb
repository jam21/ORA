class AssetLog < ApplicationRecord
	self.table_name = :cust_ora_asset_log_details_t
	self.primary_key = :log_id
	self.sequence_name = :cust_ora_asset_log_details_seq	

	belongs_to :asset
	belongs_to :asset_log_header, optional: true
end
