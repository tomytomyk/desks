class User < ApplicationRecord

    has_many :reports
    has_many :watchs
    belongs_to :occupation
    has_many :report_values
    has_many :sub_reports
    has_many :followed_relationships, foreign_key: "follower_id",class_name:"Relationship"
    has_many :followers, through: :follower_relationships
    has_many :follower_relationships, foreign_key: "followed_id",class_name:"Relationship"
    has_many :followeds, through: :followed_relationships

    validate :file_invalid?
    validates :name, presence: true
    validates :password, presence: true
    validates :occupation_id, presence: true

    def data(image_id)
    	self.ctype = image_id.content_type
    	self.photo = image_id.read
    end
    private
      def file_invalid?
      	if self.photo == nil
      	else
      	ps = ["image/jpeg", "image/gif", "image/png"]
      	errors.add(:image_id,'') if !ps.include?(self.ctype)
        errors.add(:image_id,'') if self.photo.length > 1.megabyte
        end
      end
end
