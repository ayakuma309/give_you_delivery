class Item < ApplicationRecord
  has_many :deliveries, dependent: :destroy

  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags

  validates :name, presence: true
  validates :image, presence: true
end
