class NoticeCell < Cell::ViewModel

  def action_notices
    @notices = Notice.order(created_at: :desc).limit(5)
    render
  end

end
