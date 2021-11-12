class MasterDataController < ApplicationController
  def unsynced_data    
  	render json: Location.find(params[:location_id]).unsynced_data_by_date(params[:last_data_sync_date], params[:last_users_sync_date])    
  end

  def users
  	render json: User.unsynced_users_by_date(params[:last_sync_date])
  end

end
