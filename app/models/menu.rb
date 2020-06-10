class Menu < ApplicationRecord
  # created by cmd
  # rails generate model MenuItems name:string description:string price:integer menu_id:integer
  has_many :menu_items, dependent: :destroy
  validates :name, presence: true, length: { in: 3..25 }, uniqueness: true

  def self.check_menu_exists_create_if_not(menu_name, new_menu_name)
    menu_name == "Others" ?
      Menu.new(name: new_menu_name.capitalize) :
      find(menu_name)
  end
  def self.active
    all.where("active = ?", true)
  end
end
