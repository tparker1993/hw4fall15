class UsersController < ApplicationController
   
  def user_params
    params.require(:user).permit(:user_id, :email)
  end
  
  def new
  end

  def create
    
        User.exists?(user_id: [@user.user_id])
        @user = User.create(user_params)
        @testVar=User.exists?(user_id: [@user.user_id])
        flash[:notice] = "Welcome #{@testVar} Your account has been created"
        redirect_to movies_path
  end
end
