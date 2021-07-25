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
  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    return unless @user.blank?

    flash[:danger] = '不正なアクセスです'
    redirect_to root_path
  end

  # PUT /resource/password
  # def update
  #   return redirect_to myaccount_password_path, flash: { danger: '現在のパスワードと一致しません' } unless current_user.valid_password?(password_params[:current_password])

  #   current_user.password_confirmation = password_params[:password_confirmation]

  #   if current_user.change_password!(password_params[:password])
  #     flash[:success] = 'パスワードを更新しました'
  #     redirect_to myaccount_password_path
  #   else
  #     flash[:danger] = 'パスワードの更新に失敗しました'
  #     render :edit
  #   end
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  private

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
