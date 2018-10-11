class Relationship < ApplicationRecord

    belongs_to :follow
    belongs_to :follower
	validates :follow_id, presence: true
    validates :follower_id, presence: true

end
