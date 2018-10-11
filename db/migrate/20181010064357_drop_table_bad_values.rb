class DropTableBadValues < ActiveRecord::Migration[5.2]
  def change
  	drop_table :bad_values
  end
end
