class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  
  validates :maintitle, presence: true, length: { maximum: 255 }
  validates :memo, presence: true, length: { maximum: 255 }
end
