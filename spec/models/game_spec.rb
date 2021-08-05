require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "Factories" do
    # 有効なファクトリを持つ
    it "is valid with valid factory" do
      expect(build(:game)).to be_valid
    end
  end
  
  describe "Validations" do
    # 名前がなければ無効
    it { is_expected.to validate_presence_of(:title) }
    
    # ゲームブランドがなければ無効
    it { is_expected.to validate_presence_of(:game_brand) }
    
    # 説明がなければ無効
    it { is_expected.to validate_presence_of(:description) }
    
    # 写真がなければ無効
    it { is_expected.to validate_presence_of(:image) }
  end
  
  describe "Associations" do
    # 以下の関連を持つ
    it { should have_many(:reviews)}
    it { should have_many(:bookmarks)}
    it { should have_many(:completions)}
    it { should have_many(:browsing_histories)}
  end
end
