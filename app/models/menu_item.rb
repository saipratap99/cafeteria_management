class MenuItem < ApplicationRecord
  # created by cmd
  # rails generate model MenuItems name:string
  belongs_to :menu

  def pleasant_string
    "#{name} || #{description} || #{menu.name} || #{price}"
  end
end
