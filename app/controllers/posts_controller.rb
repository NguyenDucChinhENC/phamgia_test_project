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
  	@post_or = Post.find_by id: params[:id]
    if @post_or
      @post = post_serializer @post_or
      comments = @post_or.comments
      @comments_serializer = []
      comments.each do |cmt|
        @comments_serializer.push comment_serializer cmt
      end
  	else
      redirect_to root_path
    end
  end

  private
  def post_params
  	params.require(:post).permit Post::ATTRIBUTES_PARAMS
  end

  def comment_serializer comment
    Serializers::Comment::CommentsSerializer.new(object: comment).serializer
  end

  def post_serializer post
    Serializers::Post::PostsSerializer.new(object: post).serializer
  end
end
