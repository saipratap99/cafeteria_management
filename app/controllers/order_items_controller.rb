class OrderItemsController < ApplicationController
  # created by cmd
  # rails generate controller OrderItems
  skip_before_action :verify_authenticity_token

  def index
    render plain: OrderItem.all.map { |order| order.to_a_string }.join("\n")
  end

  def show
    render plain: OrderItem.find(params[:id]).to_a_string
  end

  def create
    menu_item = MenuItem.find(params[:menu_item_id])
    if Order.where(delivered_at: [nil, ""]).where("user_id=?", 2).exists?
      order = Order.where(delivered_at: [nil, ""]).where("user_id=?", 2).first
    else
      order = Order.create!(date: Time.now, user_id: 2)
    end
    order_item = OrderItem.create!(order_id: order.id, menu_item_id: menu_item.id, menu_item_name: menu_item.name, menu_item_price: menu_item.price)
    render plain: "Order item is created details: #{order_item.to_a_string}"
  end
end
