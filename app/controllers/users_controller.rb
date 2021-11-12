class UsersController < ApplicationController

  def change_password
    pwd_params = params.permit(:user_id, :old_pin, :new_pin)
    user = User.where(user_id: pwd_params[:user_id], user_pin: pwd_params[:old_pin],end_date: nil).first
    
    if user.present?
    user.user_pin = pwd_params[:new_pin]
    user.save!

    render json: user
    else
        head :not_found 
    end
  end

end
