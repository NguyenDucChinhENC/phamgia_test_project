class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    if user_signed_in?
      comment = current_user.comments.new comment_params
      if comment.save
        @post = Post.find_by id: comment.post_id
        comments = @post.comments
        @comments_serializer = []
        comments.each do |cmt|
          @comments_serializer.push comment_serializer cmt
        end
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js
        end
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end

  def comment_serializer comment
    Serializers::Comment::CommentsSerializer.new(object: comment).serializer
  end
end
