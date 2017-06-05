class PasswordResetsController < ApplicationController
  def new
  	
  end
 def create
    @user=User.find_by(email: params[:email])

      if @user
    	@user.update(password: params[:new_password])

    	redirect_to new_session_path

      else
    	render 'new'
      end
  end
end
