require 'rails_helper'
describe Follow do
  describe '#create' do
    context 'can save' do
      it 'is valid with a following_id, followed_id' do
        follow = build(:follow)
        expect(follow).to be_valid
      end
    end

    context 'can not save null' do |follow|
      before do
        follow = build(:follow, { following_id: nil, followed_id: nil })
      end

      it 'is invalid without a following_id' do
        follow.valid?
        expect(follow.errors[:following_id]).to include("を入力してください")
      end

      it 'is invalid without a followed_id' do
        follow.valid?
        expect(follow.errors[:followed_id]).to include("を入力してください")
      end
    end
  end
end
