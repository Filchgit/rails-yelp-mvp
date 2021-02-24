class ReviewsController < ApplicationController
  before_action :set_review, only: [:show ]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end
  
  def review_params
    params.require(:review).permit(:content, :rating )
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
