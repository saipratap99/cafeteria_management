class AddColumnToMenu < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :active, :boolean, default: false
    add_column :menu_items, :active, :boolean, default: false
  end
end
