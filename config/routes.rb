Rails.application.routes.draw do
  post 'logs/asst_logs'
  post 'users/change_password'  
  get 'master_data/unsynced_data'
  get 'master_data/users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
