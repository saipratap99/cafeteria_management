class OrdersController < ApplicationController
  # created by cmd
  # rails generate controller Orders

  def index
    orders = current_user.orders
  end

  def show
  end

  def pending_orders
    ensure_owner_or_clerk_logged_in
  end

  def create
    @order = current_user.orders.being_created
    @order.status = "order_confirmed"
    @order.date = Time.now
    @order.save!
    redirect_to root_path
  end

  def update
    ensure_owner_or_clerk_logged_in
    @order = Order.find(params[:id])
    @order.status = "order_delivered"
    @order.delivered_at = Time.now
    @order.save!
    redirect_to "/pending_orders"
  end

  def cart
    @order = current_user.orders.where("status = ?", "being_created").first
  end

  def all_orders
    ensure_owner_logged_in
    @all_orders = Order.all
  end
end
