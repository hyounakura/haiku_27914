require 'rails_helper'
describe Favorite do
  describe '#create' do
    context 'can save' do
      it 'is valid with a user_id, haiku_id' do
        favorite = build(:favorite)
        expect(favorite).to be_valid
      end
    end

    context 'can not save null' do |favorite|
      before do
        favorite = build(:favorite, { user_id: nil, haiku_id: nil })
      end

      it 'is invalid without a user_id' do
        favorite.valid?
        expect(favorite.errors[:user_id]).to include("を入力してください")
      end

      it 'is invalid without a haiku_id' do
        favorite.valid?
        expect(favorite.errors[:haiku_id]).to include("を入力してください")
      end
    end
  end
end
