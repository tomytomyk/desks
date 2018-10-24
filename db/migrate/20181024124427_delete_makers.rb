class DeleteMakers < ActiveRecord::Migration[5.2]
  def change
  	drop_table :makers
  end
end
