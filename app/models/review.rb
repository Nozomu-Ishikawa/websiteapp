class Review < ApplicationRecord
  mount_uploaders :images, ImageUploader

  belongs_to :user
  belongs_to :game

  validates :title, presence: true
  validates :rate, presence: true
  validates :body, presence: true
  validates :game_brand, presence: true

  enum game_brand: {
    任天堂: 1, ソニー: 2, セガ: 3, マイクロソフト: 4, その他: 5
  }

  enum game_type: {
    未選択: 1, アクション: 2, シューティング: 3, ノベル: 4,　音楽: 5, シュミレーション: 6
  }
end
