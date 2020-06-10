class AddcolumnToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :active, :boolean, default: true
    add_column :menu_items, :active, :boolean, default: true
  end
end
