class CreateSubReports < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_reports do |t|
      t.integer :user_id
      t.integer :report_id
      t.string :body

      t.timestamps
    end
  end
end
