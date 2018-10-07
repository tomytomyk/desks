class CreateBadValues < ActiveRecord::Migration[5.2]
  def change
    create_table :bad_values do |t|
      t.integer :report_id
      t.integer :user_id

      t.timestamps
    end
  end
end
