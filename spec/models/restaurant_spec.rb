require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  subject { build(:restaurant) }

  describe 'Validation' do
    context 'main factory' do
      it 'should be valid' do
        expect(subject.valid?).to eq(true)
      end
    end

    context 'missing name' do
      it 'should not be valid' do
        subject.name = nil
        expect(subject.valid?).to eq(false)
      end
    end
  end
end
