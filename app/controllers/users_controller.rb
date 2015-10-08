class UsersController < ApplicationController
  
  def new
  end

  def create
    
        if((User.find_by user_id: params[:user]["user_id"]) !=nil)
          flash[:notice] = "Sorry, this user-id is taken. Try again."
          redirect_to new_user_path
        else
          User.create_user! (params)
          flash[:notice] = "Welcome #{params[:user]["user_id"]}. Your account has been created"
          redirect_to login_path
        end
  end
  
end