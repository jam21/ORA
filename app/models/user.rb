class User < ApplicationRecord
	self.table_name = :cust_ora_users_t
	self.primary_key = :user_id

	belongs_to :plant

	scope :unsynced_users_by_date,->(last_sync_date){
		last_sync_date='1-1-1900' if last_sync_date.nil?

		where("#{User.table_name}.last_update_date>? AND #{User.table_name}.end_date IS NULL", last_sync_date)				
	}

end
