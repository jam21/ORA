class SaveLogsJob < ApplicationJob
  queue_as :urgent

  def perform(asset_log_headers, checklist_log_headers, user_id)
    ActiveRecord::Base.transaction do
      saved_asset_log_headers(asset_log_headers, user_id)
      saved_checklist_log_headers(checklist_log_headers, user_id)

    end
    
  end

  private

  def saved_checklist_log_headers(checklist_log_headers, user_id)
    
    (checklist_log_headers||[]).each do |log_header_param|

      log_header = ChecklistLogHeader.find_by(checklist_date: log_header_param[:checklist_date], created_by: user_id)

      if(log_header.nil?)        

        log_header = ChecklistLogHeader.create(log_header_param)
      end
      
    end
    
  end

  def saved_asset_log_headers(asset_log_headers, user_id)
    
    (asset_log_headers||[]).each do |log_header_param|
      
      log_header = AssetLogHeader.find_by(log_date: log_header_param[:log_date], created_by: user_id)
      if(log_header.nil?)
        log_header = AssetLogHeader.create(log_header_param)
      end
      
    end

  end

end
