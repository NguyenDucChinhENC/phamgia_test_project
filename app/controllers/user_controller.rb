class UserController < ApplicationController
  def show
  	@user = User.find_by id: params[:id]
    @posts = @user.posts
    @posts ? @posts = @posts.reverse : nil
  	if user_signed_in?
  		@relationship = current_user.relationships.find_by monitored_id: @user.id
  		@relationship? @followed = @relationship : @followed = false 
  	end
  end
end
