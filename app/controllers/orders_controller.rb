class OrdersController < ApplicationController
  # created by cmd
  # rails generate controller Orders

  skip_before_action :verify_authenticity_token

  def index
    #render plain: Order.all.map { |order| order.to_a_string }.join("\n")
    @orders = Order.order(:id)
  end

  def show
    render plain: Order.find(params[:id]).to_a_string
  end

  def create
    @order = Order.where("status = ? and user_id = ?", "being_created", 1).first
    @order.status = "order_recived"
    @order.save
    redirect_to root_path
  end

  def cart
    @order = Order.where("status = ? and user_id = ?", "being_created", 1).first
  end
end
