class MenuItem < ApplicationRecord
  # created by cmd
  # rails generate model MenuItems name:string
  belongs_to :menu
  validates :name, presence: true, length: { in: 3..50 }, uniqueness: true
  validates :description, presence: true, length: { in: 3..60 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def self.active
    all.where("active = ?", true)
  end
end
