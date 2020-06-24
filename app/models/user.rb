class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :name, presence: true, length: { in: 3..50 }
  validates :email, presence: true, uniqueness: true, email: true
  #validates :password, length: { in: 4..25 }

  def is_clerk?
    clerk = role == "clerk" ? true : false
  end

  def is_owner?
    owner = role == "owner" ? true : false
  end

  def self.clerks
    where("role = ?", "clerk")
  end

  def self.customers
    where("role = ?", "customer")
  end

  def self.get_user_by_email(email)
    user = all.where("email = ?", email).exists? ? find_by(email: email) : false
  end

  def alter_role
    if role == "customer"
      self.role = "clerk"
    else
      self.role = "customer"
    end
    save!
  end

  def self.owners
    all.where("role = ? ", "owner")
  end
end
