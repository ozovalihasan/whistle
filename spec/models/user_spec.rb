require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:mock_user) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_uniqueness_of(:username)  }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:fullname) }
  end

  describe 'associations' do
    it { should have_many(:whiistles).dependent(:destroy) }

    it { should have_many(:following_relations).dependent(:destroy) }
    it { should have_many(:following_relations).class_name('Relation').with_foreign_key('following_id') }
    it { should have_many(:followeds).through(:following_relations) }
    it { should have_many(:followed_relations).dependent(:destroy) }
    it { should have_many(:followed_relations).class_name('Relation').with_foreign_key('followed_id') }
    it { should have_many(:followings).through(:followed_relations) }
  end

  it 'is valid with valid attributes' do
    FactoryBot.reload
    FactoryBot.create(:mock_user)
    
    expect(User.first).to be_valid
  end

  it 'is invalid when no attribute is defined' do
    expect(User.create).to_not be_valid
  end
end
