class ChangeDatatypeImageIdOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :image_id, :binary
  end
end
