class Item < ApplicationRecord

    belongs_to :maker
    belongs_to :genre
    has_many :reports

    validate :image_id, :file_invalid?

    def data(image_id)
    	self.ctype = image_id.content_type
    	self.photo = image_id.read
    end

    private
      def file_invalid?
      	ps = ["image/jpeg", "image/gif", "image/png"]
      	errors.add(:image_id,'は画像ファイルではありません。') if !ps.include?(self.ctype)
        errors.add(:image_id,'のサイズが1MBを超えています。') if self.photo.length > 1.megabyte
      end
end
