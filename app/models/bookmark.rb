class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :delivery

  validates :user_id, uniqueness: { scope: :delivery_id }
end
