class Game < ApplicationRecord

  has_many :reviews, dependent: :destroy
  has_many :browsing_histories, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :completions, dependent: :destroy


  validates :title, presence: true
  validates :game_brand, presence: true
  validates :description, presence: true
  validates :image, presence: true

  enum game_brand: {
    未選択: 0,
    任天堂: 1, ソニー: 2, セガ: 3, マイクロソフト: 4, その他: 5
  }

  mount_uploader :image, ImageUploader

end
