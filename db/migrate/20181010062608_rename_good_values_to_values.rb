class RenameGoodValuesToValues < ActiveRecord::Migration[5.2]
  def change
  	rename_table :good_values, :report_values
  end
end
