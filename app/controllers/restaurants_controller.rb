class RestaurantsController < ApplicationController

  before_action :restaurants, only: %i[ index ] 

  def index
    if params[:query].present?
      @restaurants = @restaurants.where("name LIKE ?", "%#{params[:query]}%")
    end

    if turbo_frame_request?
      render partial: "restaurants", locals: { restaurants: @restaurants }
    else
      render "index"
    end
  end

  private

  def restaurants
    @restaurants = Restaurant.all
  end
end
