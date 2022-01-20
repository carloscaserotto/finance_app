class FriendshipsController < ApplicationController
    def create
        #byebug
        friend = User.find(params[:friend])
        current_user.friendships.build(friend_id: friend.id)
        if current_user.save
            flash[:notice] = "Following friend"
        else
            flash[:alert] = "Something went wrong"
        end
        redirect_to my_friends_path
    end
    def destroy
        #byebug
        friendship = current_user.friendships.where(friend_id: params[:id]).first
        #byebug
        friendship.destroy
        flash[:notice] = "#{friendship.friend.first_name} was successfully remove from friends"
        redirect_to my_friends_path
    end
end
