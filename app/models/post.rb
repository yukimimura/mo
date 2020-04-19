class Post < ApplicationRecord
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :review, presence: true
  
end