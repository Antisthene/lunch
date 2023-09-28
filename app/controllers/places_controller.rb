class PlacesController < ApplicationController
  before_action :authenticate_user!, :user, :restaurants, :check_user

  def index
    if params[:query].present?
      @restaurants = @restaurants.where("name LIKE ?", "%#{params[:query]}%")
    end
    @places = user.places
  end

  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to selections_path, notice: "Restaurant added" }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place = user.places.find_by(id: params[:id])
    if @place&.destroy
      redirect_to selections_url, notice: "Selection was successfully deleted."
    end
  end

  private

  def user
    @user = User.find(params[:user_id])
  end

  def check_user
    redirect_to selections_url unless current_user.id == user.id
  end

  def restaurants
    @restaurants = Restaurant.all
  end

  def place_params
    params.permit(:user_id, :restaurant_id)
  end
end
