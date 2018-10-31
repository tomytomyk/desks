class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :top, :float
    add_column :users, :left, :float
  end
end
