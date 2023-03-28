class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  
  validates :maintitle, length: { maximum: 255 }
  validates :memo, length: { maximum: 255 }
  
  has_many :favorites, dependent: :destroy
  has_many :likers, through: :favorites, source: :user
  
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations, dependent: :destroy
end
