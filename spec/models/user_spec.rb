require 'rails_helper'
describe User do
  describe '#create' do
    context 'can save' do
      it 'is valid with a name, email, password, password_confirmation' do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context 'can not save null' do |user|
      before do
        user = build(:user, { name: nil, email: nil, password: nil })
      end

      it 'is invalid without a name' do
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end

      it 'is invalid without a email' do
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it 'is invalid without a password' do
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end
    end
  end
end
