class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    current_user
    @menus = Menu.order(:name)
    @order = Order.where("status = ? and user_id = ?", "being_created", 1).first
  end
end
