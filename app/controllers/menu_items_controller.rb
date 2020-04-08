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
    menu_item = MenuItem.create!(name: params[:name].capitalize, description: params[:description].capitalize, menu_id: Menu.where(name: params[:menu_name].capitalize).first.id, price: params[:price])
    render plain: "created #{menu_item.name} with #{menu_item.id}"
  end
end
