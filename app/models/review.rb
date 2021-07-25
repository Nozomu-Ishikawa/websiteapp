class Review < ApplicationRecord
  mount_uploaders :images, ImageUploader

  belongs_to :user
  belongs_to :game
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :rate, presence: true
  validates :body, presence: true
  validates :game_brand, presence: true
  validates :gametype, presence: true

  enum interesting: {
    面白い: 1, まぁまぁ: 2, どちらでもない: 3, 面白くない: 4, 特になし: 5
  }

  enum difficulty: {
    玄人専用: 1, まぁまぁ難しい: 2, 難しい: 3, 少し難しい: 4, 慣れれば簡単: 5, 簡単: 6
  }

  enum game_brand: {
    未選択: 1, 任天堂: 2, セガ: 3, ソニー: 4, マイクソフト: 5
  }

  enum gametype: {
    ホラー: 1, アクション: 2, アールピージー: 3, ノベル: 4, シューティング: 5, シミュレーション: 6
  }
end
