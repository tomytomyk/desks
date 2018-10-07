class RenameMakerColumnToItems < ActiveRecord::Migration[5.2]
  def change
  	rename_column :items, :maker, :maker_id
  end
end
