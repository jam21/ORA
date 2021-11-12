class AssetLogHeader < ApplicationRecord
	self.table_name = :cust_ora_asset_log_headers_t
	self.primary_key = :log_header_id
	self.sequence_name = :cust_ora_asset_log_headers_seq
	
	has_many :asset_logs, autosave: true, foreign_key: :log_header_id
	accepts_nested_attributes_for :asset_logs
end
