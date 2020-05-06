class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.welcome_user.subject
  #
  def welcome_user
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to cafeteria")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_confirmation.subject
  #
  def order_confirmation
    @user, @order = params[:user], params[:order]
    mail(to: @user.email, subject: "Order Confirmed")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_delivered.subject
  #
  def order_delivered
    @user, @order = params[:user], params[:order]
    mail(to: @user.email, subject: "Order delivered!")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_delivered.subject
  #
  def new_order_placed
    @order = params[:order]
    mail(to: "pratap.sai99@gmail.com", subject: "New Order Placed")
  end
end
