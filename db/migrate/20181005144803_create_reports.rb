class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :title
      t.string :body
      t.integer :user_id
      t.integer :item_id
      t.integer :value

      t.timestamps
    end
  end
end
