class SessionsController < ApplicationController
  
  def new
  end

  def create
    
    if((User.find_by user_id: params[:user]["user_id"]) ==nil)
      flash[:notice] = "Invalid user-id/email combination"
      redirect_to login_path
    else
      @user=User.find_by user_id: params[:user]["user_id"]
      if(@user.email != params[:user]["email"])
        flash[:notice] = "Invalid user-id/email combination"
        redirect_to login_path
      else
        session[:session_token]=@user.session_token
        flash[:notice] = "You are logged in as #{@user.user_id}"
        redirect_to movies_path
      end
    end
  end
  
  def destroy
    flash[:notice] = "Successful Logout"
    session[:session_token]=nil
    set_current_user
    redirect_to movies_path
  end
  
end