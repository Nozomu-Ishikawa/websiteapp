class User < ApplicationRecord
  # global settings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2], omniauth_providers: [:github]
  
  # アソシエーション
  has_many :sns
  
         def self.from_omniauth(auth)       # snsから取得した、providerとuidを使って、既存ユーザーを検索
          sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create  # sns認証したことがあればアソシエーションで取得、なければSns_credentialsテーブルにレコード作成
        
          # snsのuser or usersテーブルに対し、SNS認証で取得したメールアドレスが登録済みの場合は、取得 or なければビルド(保存はしない)
          user = sns.user || User.where(email: auth.info.email).first_or_initialize(
            name: auth.info.name,
            email: auth.info.email
          )
          if user.persisted?   
            sns.user = user
            sns.save
          end
          { user: user, sns: sns }  
        end

  validates :profile, length: { maximum: 200 }



  has_many :reviews
  
# global settings




end
