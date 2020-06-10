class Order < ApplicationRecord
  # created by cmd
  # rails generate model MenuItems date:datetime user_id:integer delivered_at:datetime
  has_many :order_items
  belongs_to :user

  def self.delivered_and_confirmed
    where.not("status = ? ", "being_created")
  end

  def self.pending_orders
    where("status= ?", "order_confirmed")
  end

  def self.being_created
    where("status= ?", "being_created").first
  end

  def order_status
    if status == "being_created"
      "Being created"
    elsif status == "order_confirmed"
      "Order Confirmed"
    else
      "Delivered at #{delivered_at.strftime("%d %B,%Y - %I:%M %p")}"
    end
  end

  def total_price
    price = 0
    order_items.each { |item| price = price + item.menu_item_price }
    price
  end

  def order_item(menu_item_name)
    order_items.where(menu_item_name: menu_item_name).first
  end

  def all_menu_item_names
    order_items.order(:menu_item_name).map { |item| item.menu_item_name }
  end

  def self.get_order_by_id(id)
    order = all.where("id = ?", id).exists? ? find(id) : false
  end

  def self.get_reports(user_id, from_date, to_date)
    if (user_id.present? && from_date.present? && to_date.present?)
      all.where("user_id = ? and date >= ? and date <= ?", user_id, from_date, to_date)
    elsif (from_date.present? && to_date.present?)
      all.where("date >= ? and date <= ?", from_date, to_date)
    elsif (user_id.present?)
      all.where("user_id = ?", user_id)
    end
  end
end
