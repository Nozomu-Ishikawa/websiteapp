class GamesController < ApplicationController
  before_action :only_user, except: %i[index show]
  before_action :set_shop, only: %i[show edit update]

  def index
    @q = Game.ransack(params[:q])
    gamebrands = params[:game_brand].blank? ? Game.game_brands.values : params[:game_brand]
    @games = @q.result(distinct: true).where(game_brand: gamebrands).page(params[:page]).order(created_at: :desc)
  end

  def show
    @review = Review.new
    @reviews = @game.reviews.includes(:user).page(params[:page]).order(created_at: :desc)

    return unless user_signed_in?

    new_browsing_history = @game.browsing_histories.build(user_id: current_user.id)

    if current_user.browsing_histories.exists?(game_id: params[:id])
      old_browsing_history = current_user.browsing_histories.find_by(game_id: params[:id])
      old_browsing_history.destroy
    end

    new_browsing_history.save

    browsing_histories = current_user.browsing_histories.all
    browsing_stock_limit = 5

    browsing_histories[0].destroy if browsing_histories.count > browsing_stock_limit
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    return render :new unless @game.save

    flash[:success] = 'ゲーム情報を追加しました'
    redirect_to games_path
  end

  private

  def set_shop
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :game_brand, :description, :image)
  end
  
end
