# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/welcome_user
  def welcome_user
    OrderMailer.welcome_user
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/order_confirmation
  def order_confirmation
    OrderMailer.order_confirmation
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/order_delivered
  def order_delivered
    OrderMailer.order_delivered
  end

end
