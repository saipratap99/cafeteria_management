class MenuItemsController < ApplicationController
  # created by cmd
  # rails generate controller MenuItems

  def index
  end

  def show
  end

  def create
    if Menu.where(name: params[:menu_name].capitalize).exists?
      menu_item = MenuItem.create!(name: params[:name].capitalize, description: params[:description].capitalize, menu_id: Menu.where(name: params[:menu_name].capitalize).first.id, price: params[:price])
    else
      menu_item = MenuItem.create!(name: params[:name].capitalize, description: params[:description].capitalize, menu_id: Menu.create!(name: params[:menu_name].capitalize).id, price: params[:price])
    end
    redirect_to menus_path
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
