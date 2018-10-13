class Item < ApplicationRecord

    belongs_to :maker
    belongs_to :genre
    has_many :reports

    validate :file_invalid?

    def data(image_id)
    	self.ctype = image_id.content_type
    	self.photo = image_id.read
    end
    private
      def file_invalid?
      	ps = ["image/jpeg", "image/gif", "image/png"]
      	errors.add(:image_id,'') if !ps.include?(self.ctype)
        errors.add(:image_id,'') if self.photo.length > 1.megabyte
      end
end
