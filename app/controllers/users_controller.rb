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
      OrderMailer.with(user: user).welcome_user.deliver_now
      flash[:notice] = "Welcome #{user.name}!"
      session[:current_user_id] = user.id
      redirect_to menus_path
    else
      flash[:error] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    unless current_user
      redirect_to root_path
    end
  end

  def update
    user = current_user
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    current_password = params[:current_password]
    if user.authenticate(current_password)
      if password == password_confirmation
        flash[:notice] = "Password updated successfully"
        user.update!(password: password)
        redirect_to menus_path
      else
        flash[:alert] = "New passwords doesnt match"
        redirect_to edit_user_path
      end
    else
      flash[:alert] = "Your current password is incorrect"
      redirect_to edit_user_path
    end
  end
end
