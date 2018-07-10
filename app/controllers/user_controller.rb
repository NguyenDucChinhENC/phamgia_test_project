class UserController < ApplicationController
  def show
  	@user = User.find_by id: params[:id]
    @posts = @user.posts
  	if user_signed_in?
  		temp = current_user.relationships.find_by monitored_id: @user.id
  		if temp != nil 
  			@followed = temp
  		else 
  			@followed = false 
  		end
  	end
  end
end
