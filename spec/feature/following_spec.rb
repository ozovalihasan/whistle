require 'rails_helper'

RSpec.describe 'following', type: :system do
  before :each do
    User.create([{ username: 'hillary', fullname: 'Hillary Kiptoo', email: 'hillary@email.com', password: 'aaaaaa', password_confirmation: 'aaaaaa' },
                 { username: 'hasan', fullname: 'Hasan Ozovali', email: 'hasan@email.com', password: 'aaaaaa', password_confirmation: 'aaaaaa' }])
  end

  it 'feature provides following any user by using plus button ' do
    do_login('hasan')
    find('a', text: '@hillary').click

    find('.fa-plus').click
    expect(page).to have_content "1\nFollowing"
  end

  it 'feature provides quiting to follow any user by using times button ' do
    User.second.following_relations.create(followed_id: User.first.id)
    User.first.whiistles.create(body: 'Hi everyone')
    do_login(User.second.username)
    find('a', text: '@hillary').click
    find('.fa-times').click
    expect(page).to have_content "0\nFollowing"
  end
end
