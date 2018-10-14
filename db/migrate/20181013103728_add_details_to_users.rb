class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ctype, :string
    add_column :users, :photo, :binary
    change_column :users, :image_id, :binary
  end
end
