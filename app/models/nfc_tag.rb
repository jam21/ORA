class NfcTag < ApplicationRecord
	self.table_name = :cust_ora_nfc_tags_t
	self.primary_key = :nfc_tag_id
	belongs_to :area
end
