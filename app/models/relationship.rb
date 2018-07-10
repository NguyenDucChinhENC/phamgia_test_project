class Relationship < ApplicationRecord
	belongs_to :user
	belongs_to :user, foreign_key: 'monitored_id'
	ATTRIBUTES_PARAMS = [:monitored_id].freeze
end
