class AddDetailsToValues < ActiveRecord::Migration[5.2]
  def change
    add_column :report_values, :flag, :boolean , default: false, null: false
  end
end
