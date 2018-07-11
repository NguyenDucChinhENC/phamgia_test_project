class Relationship < ApplicationRecord
	belongs_to :user
	ATTRIBUTES_PARAMS = [:monitored_id].freeze

	lambda_find_follow = lambda do |user_id, monitored_id|
    	where user_id: user_id, monitored_id: monitored_id
  	end

  	scope :find_follow, lambda_find_follow
end
