class User < ApplicationRecord

    belongs_to :occupation
    has_many :report_values
    has_many :follow_relationships, foreign_key: "follower_id"
    has_many :follower, through: :follow_relationships
end
