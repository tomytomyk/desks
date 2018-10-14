class User < ApplicationRecord

    has_many :reports
    belongs_to :occupation
    has_many :report_values
    has_many :follow_relationships, foreign_key: "follower_id"
    has_many :follower, through: :follow_relationships

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
      		true
      	else
      	ps = ["image/jpeg", "image/gif", "image/png"]
      	errors.add(:image_id,'') if !ps.include?(self.ctype)
        errors.add(:image_id,'') if self.photo.length > 1.megabyte
        end
      end
end
