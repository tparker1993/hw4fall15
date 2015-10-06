class UsersController < ApplicationController
  def new
  end

  def create
    
    if Movie.find params[:user_id] != nil
      @user = User.create!(user_params)
      flash[:notice] = "Welcome #{@user.user_id} Your account has been created"
      redirect_to users_path
    else
      flash[:notice] = "Sorry, this user-id is taken. Try again."
      redirect_to new_user_path
    end
  end
end
