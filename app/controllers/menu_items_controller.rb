class MenuItemsController < ApplicationController
  # created by cmd
  # rails generate controller MenuItems

  def index
  end

  def show
  end

  def create
    menu = Menu.where(name: params[:menu_name].capitalize).exists? ? Menu.where(name: params[:menu_name].capitalize).first : Menu.new(name: params[:menu_name].capitalize)
    menu.save
    menu_item = MenuItem.new(name: params[:name].capitalize, description: params[:description].capitalize, menu_id: menu.id, price: params[:price])
    if menu.save && menu_item.save
      flash[:notice] = "Item added successfully!"
      redirect_to menus_path
    else
      flash[:error] = menu_item.errors.full_messages + menu.errors.full_messages
      redirect_to menus_path
    end
  end

  def destroy
    MenuItem.find(params[:id]).destroy
    redirect_to menus_path
  end

  private

  def permit_params
    params.require(:menu_item).pemit(:name, :description, :menu_name, :price)
  end
end
