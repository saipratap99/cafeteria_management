class MenusController < ApplicationController
  # created by cmd
  # rails generate controller Menus

  def index
    @menus = Menu.order(:name)
    @order = current_user.orders.being_created
  end

  def show
  end

  def create
    menu = Menu.create!(name: params[:name].capitalize)
    render plain: "created #{menu.name} with #{menu.id}"
  end

  def destroy
    ensure_owner_logged_in
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to menus_path
  end
end
