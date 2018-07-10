class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	ATTRIBUTES_PARAMS = [:title, :body].freeze
end
