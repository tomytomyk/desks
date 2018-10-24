class RenameItemIdColumnToReports < ActiveRecord::Migration[5.2]
  def change
  	rename_column :reports, :item_id, :language_id
  end
end
