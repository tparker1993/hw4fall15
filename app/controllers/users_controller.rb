class UsersController < ApplicationController
   
  def user_params
    params.require(:user).permit(:user_id, :email)
  end
  
  def new
  end

  def create
      ##if (Movie.find params[:user_id]) != nil
        @user = User.create(user_params)
        flash[:notice] = "Welcome #{@user.user_id} #{Movie.find_by @user.user_id} Your account has been created"
        redirect_to movies_path
      ##else
        ##flash[:notice] = "Sorry,#{@user.user_id}  is taken. Try again."
        ##redirect_to new_user_path   
     ## end
  end
end
