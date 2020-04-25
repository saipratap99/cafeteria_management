class OrdersController < ApplicationController
  # created by cmd
  # rails generate controller Orders

  def index
    orders = current_user.orders.order(:id)
  end

  def show
  end

  def pending_orders
    ensure_owner_or_clerk_logged_in
  end

  def create
    @order = current_user.orders.being_created
    @order.status = "order_confirmed"
    @order.date = Time.now + 19800
    @order.save!
    flash[:notice] = "Order recived! Soon your order will be delivered"
    redirect_to menus_path
  end

  def update
    ensure_owner_or_clerk_logged_in
    @order = Order.find(params[:id])
    @order.status = "order_delivered"
    @order.delivered_at = Time.now + 19800
    @order.save!
    flash[:notice] = "#{@order.id} is marked as delivered!"
    redirect_to "/pending_orders"
  end

  def cart
    @order = current_user.orders.being_created
  end

  def all_orders
    ensure_owner_logged_in
    @all_orders = Order.order(id: :desc)
  end

  def rating
    @order = Order.find(params[:id])
    @order.ratings = params[:rating]
    @order.save!
    @order.order_items.rate_menu_items(params[:rating])
    redirect_to(orders_path, notice: "Thank you for rating order with id:#{params[:id]}")
  end
end
