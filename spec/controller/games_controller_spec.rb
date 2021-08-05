require 'rails_helper'

RSpec.describe  GamesController, type: :controller do
  
  let(:game) { create(:game) }
  
  describe "GET #index" do
    
    # 正常なレスポンスを返す
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    
    # 正常なレスポンスを返す
    it "returns http success" do
      get :show, params: { id: game.id}
      expect(response).to have_http_status(:success)
    end
  end
end