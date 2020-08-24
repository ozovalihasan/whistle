require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'validations' do
    it do
      User.create([{ username: 'hillary', fullname: 'Hillary Kiptoo', email: 'hillary@hillary.hillary', password: 'aaaaaa', password_confirmation: 'aaaaaa' },
                   { username: 'hasan', fullname: 'Hasan Ozovali', email: 'hasan@hasan.hasan', password: 'aaaaaa', password_confirmation: 'aaaaaa' }])
      subject.user_id = User.first.id
      subject.followed_id = User.second.id
      should validate_uniqueness_of(:user_id).scoped_to(:followed_id)
    end
  end

  describe 'associations' do
    it { should belong_to(:follower).class_name('User').with_foreign_key('followed_id') }
    it { should belong_to(:following).class_name('User').with_foreign_key('user_id') }
  end
end
