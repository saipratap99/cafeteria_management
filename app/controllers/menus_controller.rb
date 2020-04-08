class MenusController < ApplicationController
  # created by cmd
  # rails generate controller Menus

  skip_before_action :verify_authenticity_token

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
end
