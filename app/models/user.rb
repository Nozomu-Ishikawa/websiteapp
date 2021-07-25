class User < ApplicationRecord
  # global settings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers:  [:facebook, :twitter]
  
  # アソシエーション
  has_many :sns
  has_many :events, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :browsing_histories, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :completions, dependent: :destroy

  validates_confirmation_of :email
  attr_accessor :email_confirmation

  validates :profile, length: { maximum: 200 }

  enum role: { user: 0, admin: 200 }

  mount_uploader :image, ImageUploader

  def self.from_omniauth(auth)
    where(uid: auth.uid).first
  end

  def self.new_with_session(_, session)
    super.tap do |user|
      if (data = session['devise.omniauth_data'])
        user.email = data['email'] if user.email.blank?
        user.provider = data['provider'] if data['provider'] && user.provider.blank?
        user.uid = data['uid'] if data['uid'] && user.uid.blank?
        user.skip_confirmation!
      end
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.order_by_reviews
    User.select('users.*', 'count(reviews.id) AS reviews').left_joins(:reviews).group('users.id').order('reviews DESC')
  end

  def self.order_by_completions
    User.select('users.*', 'count(completions.id) AS completions').left_joins(:completions).group('users.id').order('completions DESC')
  end
# global settings
end
end