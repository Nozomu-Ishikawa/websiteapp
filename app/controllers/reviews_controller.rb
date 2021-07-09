class ReviewsController < ApplicationController

  before_action :set_search

  def index
    @reviews = Review.all
  end

  def show

  end

  private

  def set_search
    @q = Review.ransack(params[:q])
    # @search_articles = @q.result.page(params[:q]).to_s
  end

end
