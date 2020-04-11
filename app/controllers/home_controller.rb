class HomeController < ApplicationController
  def index
    @menus = Menu.order(:name)
    @order = Order.where("status = ? and user_id = ?", "being_created", 1).first
  end
end
