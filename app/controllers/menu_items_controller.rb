class MenuItemsController < ApplicationController
  # created by cmd
  # rails generate controller MenuItems
  skip_before_action :verify_authenticity_token

  def index
    #render plain: MenuItem.all.to_a.map { |item| item.pleasant_string }.join("\n")
  end

  def show
    render plain: MenuItem.find(params[:id]).pleasant_string
  end

  def create
    if Menu.where(name: params[:menu_name].capitalize).exists?
      menu_item = MenuItem.create!(name: params[:name].capitalize, description: params[:description].capitalize, menu_id: Menu.where(name: params[:menu_name].capitalize).first.id, price: params[:price])
    else
      menu_item = MenuItem.create!(name: params[:name].capitalize, description: params[:description].capitalize, menu_id: Menu.create!(name: params[:menu_name].capitalize).id, price: params[:price])
    end
    redirect_to "/"
  end

  private

  def permit_params
    params.require(:menu_item).pemit(:name, :description, :menu_name, :price)
  end
end
