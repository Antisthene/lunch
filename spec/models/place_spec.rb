require 'rails_helper'

RSpec.describe Place, type: :model do
  subject { build(:place) }

  describe 'Validation' do
    context 'main factory' do
      it 'should be valid' do
        expect(subject.valid?).to eq(true)
      end
    end
  end
end
