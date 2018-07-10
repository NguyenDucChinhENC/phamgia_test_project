class PostsController < ApplicationController
  def new
  end

  def create
  	if user_signed_in?
  		post = current_user.posts.new post_params
  		if post.save
  		end 
  	end
  end

  private
  def post_params
  	params.require(:post).permit Post::ATTRIBUTES_PARAMS
  end
end
