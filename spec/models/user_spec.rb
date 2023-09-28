require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'Validation' do
    context 'main factory' do
      it 'should be valid' do
        expect(subject.valid?).to eq(true)
      end
    end
  end
end
