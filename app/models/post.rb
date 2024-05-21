class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  validates :title, presence: true
  validates :image, presence: true
  validates :body, presence: true
  
  
  has_one_attached :image
  has_rich_text :body
end
