class MenusController < ApplicationController
  # created by cmd
  # rails generate controller Menus
  before_action :ensure_owner_logged_in, only: [:destroy]

  def index
    @menus = Menu.order(:name)
    @order = current_user.orders.being_created
  end

  def show
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy!
    respond_to do |format|
      format.html { redirect_to(menus_path, notice: "#{@menu.name} menu is deleted successfully!") }
      format.js
    end
  end
end
