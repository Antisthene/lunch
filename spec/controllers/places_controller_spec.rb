require 'rails_helper'

RSpec.describe PlacesController do
  describe "GET :index" do
    let(:restaurant) { create(:restaurant) }
    let(:user) { create(:user) }
    let(:place) { create(:place, restaurant: restaurant, user: user)}
    subject { Proc.new{ get :index, params: { user_id: user.id }}}

    context 'without login' do
      it 'will redirect' do
      subject.call
      expect(response.status).to eq(302)
      expect(response.body.include?('redirect')).to eq(true)
      end
    end

    context 'with user login' do
      it "assigns user @restaurants" do
        place
        sign_in user
        subject.call
        expect(assigns(:restaurants)).to eq([place.restaurant])
      end
    end
  end

  describe "POST :create" do
    let(:restaurant) { create(:restaurant) }
    let(:user) { create(:user) }
    subject { Proc.new{ post :create, params: { user_id: user.id, restaurant_id: restaurant.id }}}

    context 'without login' do
      it 'will redirect' do
      subject.call
      expect(response.status).to eq(302)
      expect(response.body.include?('redirect')).to eq(true)
      end
    end

    context 'with user login' do
      it "generates a new place" do
        sign_in user
        expect { subject.call }.to change{Place.count}.by(1)
      end
    end
  end

  describe "DELETE :destroy" do
    let(:restaurant) { create(:restaurant) }
    let(:user) { create(:user) }
    let(:place) { create(:place, restaurant: restaurant, user: user)}
    subject { Proc.new{ delete :destroy, params: { user_id: user.id, id: place.id }}}

    context 'without login' do
      it 'will redirect' do
      subject.call
      expect(response.status).to eq(302)
      expect(response.body.include?('redirect')).to eq(true)
      end
    end

    context 'with user login' do
      it "removes a place" do
        sign_in place.user
        expect(Place.count).to eq(1)
        subject.call
        expect(Place.count).to eq(0)
      end
    end
  end
end
