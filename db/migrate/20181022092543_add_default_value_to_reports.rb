class AddDefaultValueToReports < ActiveRecord::Migration[5.2]
  def change
  	change_column :reports, :value, :integer, default: 0
  end
end
