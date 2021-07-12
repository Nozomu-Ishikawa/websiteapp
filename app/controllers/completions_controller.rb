class CompletionsController < ApplicationController

  before_action :only_user
  before_action :set_game, only: %i[create destroy]

  def create
    @completion = current_user.completions.build(game_id: params[:game_id])

    return unless @completion.save
  end

  def destroy
    @completion = Completion.find_by(user_id: current_user.id, game_id: params[:game_id])

    return unless @completion.destroy
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

end
