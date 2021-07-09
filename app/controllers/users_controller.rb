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

  private

  # def customer_params
  #   params.require(:user).permit().merge(user_id: current_user.id)
  # end

  def set_command
    @user = current_user
  end

end
