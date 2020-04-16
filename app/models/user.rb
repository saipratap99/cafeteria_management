class User < ApplicationRecord
  has_secure_password
  has_many :orders

  def is_clerk?
    clerk = role == "clerk" ? true : false
  end

  def is_owner?
    owner = role == "owner" ? true : false
  end
end
