class PasswordController < Devise::PasswordsController
  def new; end

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
  end

  def edit
  end

  def update
    return redirect_to myaccount_password_path, flash: { danger: '現在のパスワードと一致しません' } unless current_user.valid_password?(user_params[:current_password])

    current_user.password_confirmation = user_params[:password_confirmation]

    if current_user.update_with_password(user_params)
      flash[:success] = 'パスワードを更新しました'
      redirect_to myaccount_password_path
    else
      flash[:danger] = 'パスワードの更新に失敗しました'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
end
