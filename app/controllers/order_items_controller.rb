class OrderItemsController < ApplicationController
  # created by cmd
  # rails generate controller OrderItems
  skip_before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in

  def index
    render plain: OrderItem.all.map { |order| order.to_a_string }.join("\n")
  end

  def show
    render plain: OrderItem.find(params[:id]).to_a_string
  end

  def create
    menu_item = MenuItem.find(params[:menu_item_id])
    order = Order.where("status = ? and user_id=?", "being_created", params[:user_id]).exists? ? Order.where("status = ? and user_id=?", "being_created", params[:user_id]).first : Order.create!(user_id: 1)
    order_item = OrderItem.create!(order_id: order.id, menu_item_id: menu_item.id, menu_item_name: menu_item.name, menu_item_price: menu_item.price)
    redirect_to root_path
  end

  def destroy
    order_item_id = params[:id]
    OrderItem.find(order_item_id).destroy
    redirect_to root_path
  end
end
