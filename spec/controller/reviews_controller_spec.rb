require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  
  let(:user) { create(:user) }
  let(:game) { create(:game) }
  let(:review) { create(:review) }
  
  before do
    login_user(user)
  end
  
  describe "GET #index" do
    
    # 正常なレスポンスを返す
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end