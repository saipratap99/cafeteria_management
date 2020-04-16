class OrdersController < ApplicationController
  # created by cmd
  # rails generate controller Orders

  skip_before_action :verify_authenticity_token

  def index
    if current_user.is_owner?
      orders = User.all
    else
      orders = current_user.orders
    end
  end

  def show
  end

  def pending_orders
    ensure_owner_or_clerk_logged_in
  end

  def create
    @order = Order.where("status = ? and user_id = ?", "being_created", current_user.id).first
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
end
