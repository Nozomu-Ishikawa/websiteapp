class Users::NoticesController < ApplicationController

  def index
    @notices = Notice.page(params[:page]).order(created_at: :desc)
  end

  def show
    @notice = Notice.unscoped.find(params[:id])
  end

end
