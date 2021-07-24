# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  def new
    super
  end

  # POST /resource/password
  def create
    @user = User.find_by_email(params[:email])

    if @user
      @user.deliver_reset_password_instructions!
      flash[:success] = 'パスワード再設定用のメールを送信しました'
      redirect_to new_user_registration_path
    else
      flash.now[:danger] = 'メールアドレスが正しくありません'
      render :new
    end
    super
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
