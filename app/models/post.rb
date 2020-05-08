class Post < ApplicationRecord
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :review, presence: true
  
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user
  
end