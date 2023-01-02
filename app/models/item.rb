class Item < ApplicationRecord
  has_many :deliveries, dependent: :destroy

  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags

  validates :name, presence: true
  validates :image, presence: true

  #タグ
  scope :with_tag, ->(tag_name) { joins(:tags).where(tags: { name: tag_name }) }
	
  def save_tags(saveitem_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - saveitem_tags
    new_tags = saveitem_tags - current_tags

    # 古いタグを消す
	  old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end

    # 新しいタグを保存
    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name: new_name)

      self.tags << post_tag
    end
  end
end
