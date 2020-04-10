class OrdersController < ApplicationController
  # created by cmd
  # rails generate controller Orders

  skip_before_action :verify_authenticity_token

  def index
    #render plain: Order.all.map { |order| order.to_a_string }.join("\n")
    @orders = Order.all
  end

  def show
    render plain: Order.find(params[:id]).to_a_string
  end

  def create
    @order = Order.create!(date: Time.now, user_id: params[:user_id])
    render plain: "Order i created with id #{@order.to_a_string}"
  end
end
