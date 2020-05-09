class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in, only: [:create, :new]
  before_action :ensure_owner_logged_in, only: [:index]

  def new
    if current_user
      redirect_to(menus_path, notice: "Your'e already signed up user")
    end
  end

  def index
    @clerks = User.clerks.order(:id)
    @customers = User.customers.order(:id)
  end

  def create
    name, email = params[:name], params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    user = User.new(name: name.capitalize,
                    email: email,
                    role: "customer",
                    password: password,
                    password_confirmation: password_confirmation)
    if user.save
      OrderMailer.with(user: user).welcome_user.deliver_now
      session[:current_user_id] = user.id
      redirect_to(menus_path, notice: "Welcome #{user.name}!")
    else
      redirect_to(new_user_path, error: user.errors.full_messages)
    end
  end

  def edit
  end

  def update
    user, password = current_user, params[:password]
    password_confirmation = params[:password_confirmation]
    current_password = params[:current_password]
    if user.authenticate(current_password)
      if password == password_confirmation
        user.update!(password: password)
        redirect_to(menus_path, notice: "Password updated successfully")
      else
        redirect_to(edit_user_path, alert: "New passwords doesnt match")
      end
    else
      redirect_to(edit_user_path, alert: "Your current password is incorrect")
    end
  end
end
