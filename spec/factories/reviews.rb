FactoryBot.define do
  factory :review do
    id { 1 }
    user_id { 2 }
    game_id { 1 }
    title { 'ホゲーム' }
    game_brand { 5 }
    gametype { 5 }
    rate { 5 }
    body { '面白いです。' }
    images { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }   
  end
end
