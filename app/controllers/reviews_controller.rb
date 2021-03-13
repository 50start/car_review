class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @car = Car.find(params[:car_id])
    @reviews = @car.reviews
  end
  
   def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to car_reviews_path(@review.car)
    else
      @car = Car.find(params[:car_id])
      render "cars/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:car_id, :score, :content)
  end
end

