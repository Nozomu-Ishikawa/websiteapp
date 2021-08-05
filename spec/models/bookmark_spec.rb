require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe "Factories" do
    # 有効なファクトリを持つ
    it "is valid with valid factory" do
      create(:game)
      expect(build(:bookmark)).to be_valid
    end
  end
  
  describe "Validations" do
    # ユーザーIDがなければ無効
    it { is_expected.to validate_presence_of(:user_id) }
    
    # ゲームIDがなければ無効
    it { is_expected.to validate_presence_of(:game_id) }
  end
  
  describe "Associations" do
    # 以下の関連を持つ
    it { should belong_to(:user) }
    it { should belong_to(:game) }
  end
end
