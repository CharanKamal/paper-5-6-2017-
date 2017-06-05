class FriendshipsController < ApplicationController
	def create
	  @friendship = current_user.friendships.build(friend_id: params[:friend_id],accepted: true)
	  if (@friendship.save) 
	    flash[:notice] = "Friend requested."
	    redirect_to users_path
	  else
	    flash[:error] = "Unable to request friendship."
	    redirect_to users_path
	  end
	end

	def update
	@friendship = Friendship.where(:user_id=> current_user.id,friend_id: params[:id])
	@friendship.update(status: "accepted")
	
	  if @friendshop.save(accepted: true) && update_friend_accepted.update(accepted: true)
	    redirect_to root_url, notice: "Successfully confirmed friend!"
	  else
	    redirect_to root_url, notice: "Sorry! Could not confirm friend!"
	  end
	end

	def destroy
	  @friendship = Friendship.where(:user_id=> current_user.id,friend_id: params[:id]).first
	  @friendship.destroy
	  flash[:notice] = "Removed friendship."
	  redirect_to users_path
	end
end
