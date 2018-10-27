class ChangeColumnToReport < ActiveRecord::Migration[5.2]
  def change
  	change_column :reports, :language_id, :integer, default: 0
  end
end
