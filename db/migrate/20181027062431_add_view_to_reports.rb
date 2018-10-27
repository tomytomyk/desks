class AddViewToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :view, :integer, default: 0
  end
end
