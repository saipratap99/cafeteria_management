class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :name, :password, presence: true, length: { in: 3..50 }
  validates :email, presence: true, uniqueness: true

  def is_clerk?
    clerk = role == "clerk" ? true : false
  end

  def is_owner?
    owner = role == "owner" ? true : false
  end
end
