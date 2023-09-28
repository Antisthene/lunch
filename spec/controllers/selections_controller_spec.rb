require 'rails_helper'

RSpec.describe SelectionsController do
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
      it "assigns user @places" do
        sign_in place.user
        subject.call
        expect(assigns(:places)).to eq([place])
      end
    end
  end
end
