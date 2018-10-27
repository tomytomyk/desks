class AddViewToLanguages < ActiveRecord::Migration[5.2]
  def change
    add_column :languages, :view, :integer, default: 0
  end
end
