class MenusController < ApplicationController
  # created by cmd
  # rails generate controller Menus

  def index
    @menus = Menu.all
  end

  def show
    render plain: Menu.find(params[:id]).name
  end

  def create
    menu = Menu.create!(name: params[:name].capitalize)
    render plain: "created #{menu.name} with #{menu.id}"
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to root_path
  end
end
