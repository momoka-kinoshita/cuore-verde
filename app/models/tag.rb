class Tag < ApplicationRecord
  has_many :post_tag_relations, dependent: :destroy
  has_many :posts, through: :post_tag_relations, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :category, presence: true, length: { maximum: 255 }
end
