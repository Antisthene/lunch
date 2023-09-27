class Restaurant < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :city, presence: true, allow_blank: false

  has_many :places
  has_many :users, through: :places

  def map_link
    "https://www.google.com/maps?q=#{lat},#{lon}"
  end
end
