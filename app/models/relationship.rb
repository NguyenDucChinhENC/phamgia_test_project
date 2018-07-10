class Relationship < ApplicationRecord
	belongs_to :user
	ATTRIBUTES_PARAMS = [:monitored_id].freeze
end
