require 'rails_helper'
describe Haiku do
  describe '#create' do
    context 'can save' do
      it 'is valid with a kami, naka, simo' do
        haiku = build(:haiku)
        expect(haiku).to be_valid
      end
    end

    context 'can not save null' do |haiku|
      before do
        haiku = build(:haiku, { kami: nil, naka: nil, simo: nil })
      end

      it 'is invalid without a kami' do
        haiku.valid?
        expect(haiku.errors[:kami]).to include("を入力してください")
      end

      it 'is invalid without a naka' do
        haiku.valid?
        expect(haiku.errors[:naka]).to include("を入力してください")
      end

      it 'is invalid without a simo' do
        haiku.valid?
        expect(haiku.errors[:simo]).to include("を入力してください")
      end
    end
  end
end
