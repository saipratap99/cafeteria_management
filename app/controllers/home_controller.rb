class HomeController < ApplicationController
  def index
    @menus = Menu.all
  end
end
