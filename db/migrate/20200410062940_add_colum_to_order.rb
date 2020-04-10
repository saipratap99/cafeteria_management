class AddColumToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :status, :string, default: "being_created"
    add_column :orders, :ordered_at, :datetime, default: "being_created"
  end
end
