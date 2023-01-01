class Item < ApplicationRecord
  has_many :deliveries, dependent: :destroy

  validates :name, presence: true
  validates :image, presence: true
end
