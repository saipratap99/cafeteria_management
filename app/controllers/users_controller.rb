class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    if current_user
      flash[:notice] = "Your'e already signed up user"
      redirect_to menus_path
    end
  end

  def index
    ensure_owner_logged_in
    @clerks = User.clerks
    @customers = User.customers
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    user = User.new(name: name.capitalize, email: email, role: "customer", password: password, password_confirmation: password_confirmation)
    if user.save
      user.save!
      flash[:notice] = "Welcome #{user.name}!"
      session[:current_user_id] = user.id
      redirect_to menus_path
    else
      flash[:error] = user.errors.full_messages
      redirect_to new_user_path
    end
  end
end
