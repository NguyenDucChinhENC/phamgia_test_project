module Serializers
	module Post
		class PostsSerializer < Serializers::SupportSerializer
			attrs :id, :user_id, :title, :body, :created_at
			attrs :user_name

			def user_name
				user = User.find_by id: user_id
				user.name
			end
		end
	end
end