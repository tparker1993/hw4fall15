class UsersController < ApplicationController
  def new
  end

  def create
    
      @user = User.create!(user_params)
      flash[:notice] = "Welcome #{@user.user_id} Your account has been created"
      redirect_to movies_path
  end
end
