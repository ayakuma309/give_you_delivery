class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  has_many :deliveries, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_deliveries, through: :bookmarks, source: :delivery

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 20 }

  enum role: { general: 0, admin: 1 }

  def mine?(object)
    object.user_id == id
  end

  def bookmark?(delivery)
    bookmark_deliveries.include?(delivery)
  end
end
