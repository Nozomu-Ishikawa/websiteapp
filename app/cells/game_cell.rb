class GameCell < Cell::ViewModel

  def many_reviews
    @games = Game.find(Review.group(:game_id).order('count(game_id) desc').limit(3).pluck(:game_id))
    render
  end

end
