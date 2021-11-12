class SyncableRecord < ApplicationRecord
	SYNCABLES = ["Location","Plant","Area","Asset","Checklist","NfcTag"]

	scope :unsynced,->(last_sync_date){
		last_sync_date='1-1-1900' if last_sync_date.nil?
		where("last_update_date>?",last_sync_date)
	}

	def self.unsynced_data(last_sync_date)		
		unsynced_hash = {}
		SYNCABLES.each{|s|			
			unsynced_hash[s.downcase.pluralize]=s.constantize.unsynced(last_sync_date)
		}
		unsynced_hash
	end

	def self.users
		User.all
	end
end