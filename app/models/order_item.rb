class OrderItem < ApplicationRecord
  # created by cmd
  # rails generate model MenuItems order_id:integer menu_item_id:integer menu_item_name:string menu_item_price:integer
  belongs_to :order
  belongs_to :menu_item

  def to_a_string
    "#{id} #{order_id} #{menu_item_id} #{menu_item_name} #{menu_item_price}"
  end
end
