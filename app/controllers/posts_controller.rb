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

  def show
  	@post = Post.find_by id: params[:id]
  	unless @post
      redirect_to root_path
    end
  end

  private
  def post_params
  	params.require(:post).permit Post::ATTRIBUTES_PARAMS
  end
end
