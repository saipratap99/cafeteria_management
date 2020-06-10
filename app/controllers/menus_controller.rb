class MenusController < ApplicationController
  # created by cmd
  # rails generate controller Menus
  before_action :ensure_owner_logged_in, only: [:destroy, :all]

  def index
    @menus = Menu.order(:name)
    @order = current_user.orders.being_created
  end

  def all
    @menus = Menu.order(:name)
  end

  def show
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    menu = Menu.find(params[:id])
    menu.update(name: params[:name].capitalize,
                active: params[:active])
    if menu.save
      redirect_to(menus_path, notice: "#{menu.name} menu updated successfully!")
    else
      flash[:error] = menu.errors.full_messages
      redirect_to edit_menu_path
    end
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
