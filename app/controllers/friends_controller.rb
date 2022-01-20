class FriendsController < ApplicationController
    def my_friends
        #byebug
        @friends = current_user.friends
    end

    def search
        #byebug
        if params[:friend].present?
            #@friend = User.where(first_name: params[:friend]).first
            @friends = User.search(params[:friend])
            @friends = current_user.except_current_user(@friends)
            if @friends
                respond_to do |format|
                    format.js { render partial: 'friends/result' }
                end
            else
                respond_to do |format|
                    flash.now[:alert] = "There is no friend with that name"
                    format.js { render partial: 'friends/result' }
                end
            end
        else
            respond_to do |format|
                flash.now[:alert] = "Please enter a name to search"
                format.js { render partial: 'friends/result' }
            end
        end
    end
    
end
