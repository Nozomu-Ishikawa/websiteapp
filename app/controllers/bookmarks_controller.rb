class BookmarksController < ApplicationController
  before_action :only_user
  before_action :set_game, only: %i[create destroy]

  def create
    @bookmark = current_user.bookmarks.build(game_id: params[:game_id])

    return unless @bookmark.save
  end

  def destroy
    @bookmark = Bookmark.find_by(user_id: current_user.id, game_id: params[:game_id])

    return unless @bookmark.destroy
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end
end
