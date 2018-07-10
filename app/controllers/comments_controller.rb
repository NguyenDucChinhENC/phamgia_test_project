class CommentsController < ApplicationController
	def create
		if user_signed_in?
			comment = current_user.comments.new comment_params
			if comment.save
			end
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:post_id, :body)
	end
end
