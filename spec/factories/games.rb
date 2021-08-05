FactoryBot.define do
  factory :games do
    id { 1 }
    title { 'ほげーム' }
    game＿brand { 2 } # 任天堂
    description { 'ホゲホゲホゲホゲホゲホゲホゲホゲホゲホゲホゲ' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
  end
end
