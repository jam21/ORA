class Tag < ApplicationRecord
	self.table_name = :tags_t
	self.primary_key = :t_id
	belongs_to :area
end
