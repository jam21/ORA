class LogsController < ApplicationController

  def asst_logs
    asset_log_headers = set_asset_header_who_fields

    checklist_log_headers = set_checklist_header_who_fields

    # ActiveRecord::Base.transaction do
    #   saved_asset_log_headers(asset_log_headers, user_id_param)
    #   saved_checklist_log_headers(checklist_log_headers, user_id_param)

    # end

    SaveLogsJob.perform_later(asset_log_headers, checklist_log_headers, user_id_param)
    render json: {status: :ok}          
  end


  private

  def user_id_param
    params.require(:user_id)
  end

  def set_who_fields(model_param)
      model_param[:last_update_login] = user_id_param
      model_param[:last_update_date] = Time.now
      model_param[:last_updated_by] = -1
      model_param[:creation_date] = Time.now
      model_param[:created_by] = user_id_param
  end

  def asset_log_header_params    
    params.require(:asset_log_headers).map{|h|
      h.require(:asset_log_header).permit(:area_id, :comments,:log_date,:log_required,:latitude,:longitude,:shift, asset_logs_attributes:[:asset_id,:current_value,:mwr_required,:mwr_justification])
    }
  end

  def set_asset_header_who_fields
    asset_log_header_params.map{|permited_header|
      set_who_fields(permited_header)
      permited_header[:asset_logs_attributes].each do |log_detail|
        set_who_fields(log_detail)        
      end

      permited_header

    } if params[:asset_log_headers].present?
  end

  

  def checklist_log_header_params

    params.require(:checklist_log_headers).map{|h|      
      h.require(:checklist_log_header).permit(:area_id, :comments,:checklist_date,:checklist_required,:latitude,:longitude,:shift, checklist_logs_attributes:[:checklist_id,:current_value])
    }

  end

  def set_checklist_header_who_fields
    checklist_log_header_params.map { |permited_header|
      set_who_fields(permited_header)
      permited_header[:checklist_logs_attributes].each do |log_detail|
        set_who_fields(log_detail)        
      end

      permited_header
      
    } if params[:checklist_log_headers].present?
    
  end

















  def saved_checklist_log_headers(checklist_log_headers, user_id)
    
    (checklist_log_headers||[]).each do |log_header_param|
      puts "CKList Params ------->>>>#{log_header_param}"
      puts "CKList Params-Hash ------->>>>#{log_header_param.to_h}"
      log_header = ChecklistLogHeader.find_by(checklist_date: log_header_param[:checklist_date], created_by: user_id)

      if(log_header.nil?)        

        log_header = ChecklistLogHeader.create(log_header_param)
      end
      
    end
    
  end

  def saved_asset_log_headers(asset_log_headers, user_id)
    
    (asset_log_headers||[]).each do |log_header_param|
      puts "Asset Params ------->>>>#{log_header_param}"
      puts "Asset Params-Hash ------->>>>#{log_header_param.to_h}"
      
      log_header = AssetLogHeader.find_by(log_date: log_header_param[:log_date], created_by: user_id)
      if(log_header.nil?)
        log_header = AssetLogHeader.create(log_header_param)
      end
      
    end

  end

end
