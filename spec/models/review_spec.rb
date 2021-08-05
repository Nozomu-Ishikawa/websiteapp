require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "Factories" do
    # 有効なファクトリを持つ
    it "is valid with valid factory" do
      create(:game)
      expect(build(:review)).to be_valid
    end
  end
  
  describe "Validations" do

    # ゲームタイトルの名前がなければ無効
    it { is_expected.to validate_presence_of(:title) }
    
    # ゲームブランドがなければ無効
    it { is_expected.to validate_presence_of(:game_brand) }
    
    # ゲームジャンルがなければ無効
    it { is_expected.to validate_presence_of(:gametype) }
    
    # 評価がなければ無効
    it { is_expected.to validate_presence_of(:rate) }
    
    # 本文がなければ無効
    it { is_expected.to validate_presence_of(:body) }
  end
  
  describe "Associations" do
    # 以下の関連を持つ
    it { should belong_to(:user)}
    it { should belong_to(:game)}
    it { should have_many(:likes)}
  end
end
