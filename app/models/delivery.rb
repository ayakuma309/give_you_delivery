class Delivery < ApplicationRecord
  belongs_to :user
  belongs_to :item

  has_many :bookmarks, dependent: :destroy

  validates :addressee, presence: true, length: { maximum: 20 }
  validates :addresser, presence: true, length: { maximum: 20 }
  validates :comment, presence: true, length: { maximum: 100 }
end
