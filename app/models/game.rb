class Game < ApplicationRecord

  belongs_to :user

  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true


end
