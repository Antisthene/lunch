require 'rails_helper'

RSpec.describe RestaurantsController do
  describe "GET :index" do
    let(:restaurant) { create(:restaurant) }
    it "assigns @restaurants" do
      restaurant
      get :index
      expect(assigns(:restaurants)).to eq([restaurant])
    end
  end
end
