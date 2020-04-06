class MenusController < ApplicationController
  # created by cmd
  # rails generate controller Menus

  skip_before_action :verify_authenticity_token

  def index
    render plain: Menu.all.to_a.map { |menu| menu.name }.join("\n")
  end

  def show
    render plain: Menu.find(params[:id]).name
  end

  def create
    menu = Menu.create!(name: params[:name].capitalize)
    render plain: "created #{menu.name} with #{menu.id}"
  end
end
