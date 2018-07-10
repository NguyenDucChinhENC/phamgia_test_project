class Post < ApplicationRecord
	belongs_to :user
	ATTRIBUTES_PARAMS = [:title, :body].freeze
end
