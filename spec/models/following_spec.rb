require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'validations' do
    it do
      User.create([{ username: 'hillary', fullname: 'Hillary Kiptoo', email: 'hillary@email.com',
                     password: 'aaaaaa', password_confirmation: 'aaaaaa' },
                   { username: 'hasan', fullname: 'Hasan Ozovali', email: 'hasan@email.com',
                     password: 'aaaaaa', password_confirmation: 'aaaaaa' }])
      subject.user_id = User.first.id
      subject.followed_id = User.second.id
      should validate_uniqueness_of(:user_id).scoped_to(:followed_id)
    end

    it 'raises an error if followed and follower one are same ' do
      User.create(username: 'hillary', fullname: 'Hillary Kiptoo', email: 'hillary@email.com',
                  password: 'aaaaaa', password_confirmation: 'aaaaaa')
      following = Following.new(user_id: User.first.id, followed_id: User.first.id)
      following.valid?
      following.errors.full_messages.should include('Users cannot follow themselves')
    end
  end

  describe 'associations' do
    it { should belong_to(:follower).class_name('User').with_foreign_key('followed_id') }
    it { should belong_to(:following).class_name('User').with_foreign_key('user_id') }
  end
end
