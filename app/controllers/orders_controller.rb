class OrdersController < ApplicationController
  # created by cmd
  # rails generate controller Orders
  before_action :ensure_owner_logged_in, only: [:all_orders, :reports]
  before_action :ensure_owner_or_clerk_logged_in, only: [:pending_orders, :update]

  def index
    orders = current_user.orders.order(:id)
  end

  def show
  end

  def pending_orders
  end

  def create
    @order = current_user.orders.being_created
    if @order.order_items.empty?
      redirect_to(cart_path, alert: "Order must have atleast 1 item")
    else
      @order.status = "order_confirmed"
      @order.date = Time.now
      @order.save!
      OrderMailer.with(order: @order, user: current_user).order_confirmation.deliver_now
      redirect_to(menus_path, notice: "Order recived! Soon your order will be delivered")
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.status = "order_delivered"
    @order.delivered_at = Time.now
    @order.save!
    OrderMailer.with(order: @order, user: @order.user).order_delivered.deliver_now
    OrderMailer.with(order: @order).new_order_placed.deliver_now
    respond_to do |format|
      format.html { redirect_to("/pending_orders", notice: "#{@order.id} is marked as delivered!") }
      format.js
    end
  end

  def cart
    @order = current_user.orders.being_created
  end

  def all_orders
    @all_orders = Order.order(id: :desc)
  end

  def rating
    @order = Order.find(params[:id])
    @order.ratings = params[:rating]
    @order.save!
    @order.order_items.rate_menu_items(params[:rating])
    respond_to do |format|
      format.html { redirect_to(orders_path, notice: "Thank you for rating order with id:#{@order.id}") }
      format.js
    end
  end

  def reports
    @found = User.where("id = ?", params[:user_id]).exists?
    @all_orders = Order.get_reports(params[:user_id],
                                    params[:from_date],
                                    params[:to_date]).order(id: :desc)
    respond_to do |format|
      format.js
    end
  end
end
