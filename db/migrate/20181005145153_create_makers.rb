class CreateMakers < ActiveRecord::Migration[5.2]
  def change
    create_table :makers do |t|
      t.string :name
      t.string :maker_url

      t.timestamps
    end
  end
end
