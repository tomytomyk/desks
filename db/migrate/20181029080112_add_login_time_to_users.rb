class AddLoginTimeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :login_time, :datetime, default: 0
  end
end
