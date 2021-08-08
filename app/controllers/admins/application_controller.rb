class Admins::ApplicationController < ::ApplicationController
  layout 'admins'

  private

  def only_admin
    return if current_user&.admin?

    flash[:danger] = '管理者権限が必要です'
    redirect_to new_user_session_path
  end
end