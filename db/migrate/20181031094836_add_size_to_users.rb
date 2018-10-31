class AddSizeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :size, :float
  end
end
