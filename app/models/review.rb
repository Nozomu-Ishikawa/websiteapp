class Review < ApplicationRecord

  belongs_to :user
  has_many :games

  validates :title, presence: true
  validates :game_title, presence: true
  validates :rate, presence: true
  validates :body, presence: true
  validates :game_name, presence: true
  validates :game_time, presence: true

end
