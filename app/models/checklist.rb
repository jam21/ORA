class Checklist < ApplicationRecord
	self.table_name = :cust_ora_checklists_t
	self.primary_key = :checklist_id

	belongs_to :area
	has_many :checklist_logs
end
