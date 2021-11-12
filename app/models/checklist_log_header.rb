class ChecklistLogHeader < ApplicationRecord
	self.table_name = :cust_ora_cklist_log_headers_t
	self.primary_key = :cklist_log_header_id
	self.sequence_name = :cust_ora_cklist_log_header_seq

	has_many :checklist_logs, autosave: true, foreign_key: :cklist_log_header_id
	accepts_nested_attributes_for :checklist_logs

end
