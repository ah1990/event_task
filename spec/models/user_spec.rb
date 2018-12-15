require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:surname) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password_digest) }
  end

  describe 'email' do
    it 'should valid' do
      expect(user).to be_valid
    end

    it 'should always be downcase' do
      user.email = 'TeST@yandex.ru'
      user.save
      expect(user).to be_valid
      expect(user.email).to eq('test@yandex.ru')
    end

    it 'should invalid' do
      user.email = 'вовао@yandex.ru'
      expect(user).to_not be_valid
      expect(user.errors.messages[:email]).to eq(['only allows valid emails'])
    end
  end
end
