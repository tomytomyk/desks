class ChangeDatatypePhotoOfItems < ActiveRecord::Migration[5.2]
  def change
  	change_column :items, :photo, :binary
  end
end
