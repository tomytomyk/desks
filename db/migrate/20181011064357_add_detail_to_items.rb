class AddDetailToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :ctype, :integer
    add_column :items, :photo, :integer
  end
end