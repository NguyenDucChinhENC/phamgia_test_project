module Serializers
	module Comment
		class CommentsSerializer < Serializers::SupportSerializer
			attrs :id, :user_id, :post_id, :body, :created_at
			attrs :user_name

			def user_name
				user = User.find_by id: user_id
				user.name
			end
		end
	end
end