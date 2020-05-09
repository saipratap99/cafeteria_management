class MenuItemsController < ApplicationController
  # created by cmd
  # rails generate controller MenuItems
  before_action :ensure_owner_logged_in, only: [:create, :destroy, :edit, :update]

  def index
  end

  def show
  end

  def create
    menu = Menu.check_menu_exists_create_if_not(params[:menu_name], params[:new_menu_name])
    menu.save
    menu_item = MenuItem.new(name: params[:name].capitalize,
                             description: params[:description].capitalize,
                             menu_id: menu.id,
                             price: params[:price])
    if menu.save && menu_item.save
      redirect_to(menus_path, notice: "#{menu_item.name} item added successfully!")
    else
      flash[:error] = menu_item.errors.full_messages + menu.errors.full_messages
      redirect_to menus_path
    end
  end

  def destroy
    ensure_owner_logged_in
    menu_item = MenuItem.find(params[:id])
    menu_item.destroy!
    redirect_to(menus_path, notice: "#{menu_item.name} menu item is deleted!")
  end

  def edit
    ensure_owner_logged_in
    @menu_item = MenuItem.find(params[:id])
  end

  def update
    menu = Menu.check_menu_exists_create_if_not(params[:menu_name], params[:new_menu_name])
    menu.save
    menu_item = MenuItem.find(params[:id])
    menu_item.update(name: params[:name].capitalize,
                     description: params[:description].capitalize,
                     menu_id: menu.id,
                     price: params[:price])
    if menu.save && menu_item.save
      redirect_to(menus_path, notice: "#{menu_item.name} item updated successfully!")
    else
      flash[:error] = menu_item.errors.full_messages + menu.errors.full_messages
      redirect_to edit_menu_item_path
    end
  end

  private

  def permit_params
    params.require(:menu_item).pemit(:name, :description, :menu_name, :price)
  end
end
