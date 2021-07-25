class UsersController < ApplicationController
  # layout 'layouts/user_profile_layout', only: [:show]

  before_action :set_command, only: :index
  # before_action :costomer_params

  def index
    @user = User.all

    @counts = Game.count
  end

  def show
  end

  def edit
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now 
      user.name = "ゲスト"
      user.password = "123456789"
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private


  def set_command
    @user = current_user
  end


end
