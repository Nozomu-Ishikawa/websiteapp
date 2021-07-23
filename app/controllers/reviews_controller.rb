class ReviewsController < ApplicationController

  before_action :only_user, except: %i[index show]
  before_action :set_review, only: %i[show edit update destroy]

  def index
    @q = Review.ransack(params[:q])
    interestings = params[:interesting].blank? ? Review.interestings.values : params[:interesting]
    @reviews = @q.result(distinct: true).includes(:user).where(interesting: interestings).page(params[:page]).per(6).order(created_at: :desc)
  end

  def show; end

  def create
    @game = Game.find(params[:format])

    unless current_user.reviews.create(
      game_title: @game.title,
      game_brand: @game.game_brand,
      game_id: @game.id,
      title: review_params[:title],
      interesting: review_params[:interesting],
      difficulty: review_params[:difficulty],
      gametype: review_params[:gametype],
      rate: review_params[:rate],
      body: review_params[:body],
      images: review_params[:images]
    )
      render :new
    end

    flash[:success] = 'レビューを投稿しました'
    redirect_to game_path(@game)
  end

  def edit; end

  def update
    render :edit unless @review.update(review_params)

    flash[:success] = 'レビューを編集しました'
    redirect_to review_path(@review)
  end

  def destroy
    @review.destroy
    flash[:success] = 'レビューを削除しました'
    redirect_to reviews_path
  end

  private

  def set_review
    @review = Review.joins(:user).find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :interesting, :difficulty, :game_brand, :gametype, :rate, :body, images: [])
  end

end
