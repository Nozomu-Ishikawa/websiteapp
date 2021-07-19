class BrowsingHistoryCell < Cell::ViewModel
  include ApplicationHelper

  def recent_browsing_histories
    current_user ||= User.find_by(params[:id])
    @browsing_histories = current_user.browsing_histories.includes(:game).order(created_at: :desc)
    render
  end

end
