class Article < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true

  enum category: { 未選択: 0, セール中: 1, 新発売: 2 }

  mount_uploader :image, ImageUploader
end
