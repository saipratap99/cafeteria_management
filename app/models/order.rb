class Order < ApplicationRecord
  # created by cmd
  # rails generate model MenuItems date:datetime user_id:integer delivered_at:datetime
  has_many :order_items

  def to_a_string
    "#{id} #{date} ITEMS:#{order_items.map { |item| item.menu_item_name }.join("--")} TOTAL PRICE:#{total_price} #{delivered_at}"
  end

  def total_price
    price = 0
    order_items.each { |item| price = price + item.menu_item_price }
    price
  end
end