class ChecklistLog < ApplicationRecord
	self.table_name = :cust_ora_cklist_log_details_t
	self.primary_key = :cklist_log_id
	self.sequence_name = :cust_ora_cklist_log_detail_seq

	belongs_to :checklist	
	belongs_to :checklist_log_header, optional: true
end
