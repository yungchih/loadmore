class Feed < ActiveRecord::Base
	has_many :feed_tags
	has_many :tags, through: :feed_tags
end
