require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:username) }
  end

  describe 'associations' do
    it { should have_many(:whiistles).dependent(:destroy) }

    it { should have_many(:following_relations).dependent(:destroy).class_name('Following').with_foreign_key('user_id') }
    it { should have_many(:followings).through(:following_relations).source(:follower) }
    it { should have_many(:followed_relations).dependent(:destroy).class_name('Following').with_foreign_key('followed_id') }
    it { should have_many(:followers).through(:followed_relations).source(:following) }
  end

  it 'is valid with valid attributes' do
    User.create(username: 'hillary', fullname: 'Hillary Kiptoo', email: 'hillary@gmail.com', password: 'aaaaaa', password_confirmation: 'aaaaaa')
    expect(User.first).to be_valid
  end

  it 'is invalid when no attribute is defined' do
    expect(User.create).to_not be_valid
  end
end
