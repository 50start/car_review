class CarsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
    @review = Review.new
  end
end
