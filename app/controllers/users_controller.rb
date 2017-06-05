class UsersController < ApplicationController
  def index
    @users=User.all

    
  end

  def show
  	@user=User.find(params[:id])
  end

  def new
  	@user=User.new
  end

  def create
  	@user=User.new(params_user)
  	if @user.save
  		redirect_to new_session_path
  	else
  		render 'new'
  	end
  end

  private
  def params_user
  	params.require(:user).permit(:fname,:lname,:uname,:image,:email,:password)
  end
end
