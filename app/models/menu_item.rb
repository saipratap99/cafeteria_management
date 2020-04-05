class MenuItem < ApplicationRecord
  belongs_to :menu

  def pleasant_string
    "#{name} || #{description} || #{menu.name} || #{price}"
  end
end
