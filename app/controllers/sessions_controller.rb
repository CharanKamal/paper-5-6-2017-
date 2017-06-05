class SessionsController < ApplicationController
  def new

  end

  def create
  	user_email=User.find_by_email(params[:email])
  	user_uname=User.find_by_uname(params[:uname])
  	if (user_email && user_email.authenticate(params[:password])) || (user_uname && user_uname.authenticate(params[:password]))
  		if user_email
  			session[:user_id]= user_email.id
  			redirect_to users_path
  		else
  			session[:user_id]= user_uname.id
  		redirect_to users_path
  	    end
  	 else
  		render 'new'
  	 end
  end

  def destroy
  	session[:user_id]=nil
  	redirect_to new_user_path
  end
end
