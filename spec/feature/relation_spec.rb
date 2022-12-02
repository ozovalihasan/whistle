require 'rails_helper'

RSpec.describe 'relation', type: :feature do
  before :each do
    FactoryBot.create_pair(:mock_user)
  end

  scenario 'A user can follow another user by using a button' do
    sign_in User.first
    visit root_path
    
    find(text: "Follow").click

    expect(page).to have_content "1\nFollowings"
  end
    
  scenario 'A user can follow another user by using a button' do
    sign_in User.first
    visit root_path
    find('a', text: "@#{User.second.username}").click
    find('.bi-plus-circle').click

    expect(page).to have_content "1\nFollowings"
  end

  scenario 'A user can unfollow another user by using a button' do
    User.first.following_relations.create(followed_id: User.second.id)
    
    sign_in User.first
    visit user_path(User.second)
    find('.bi-x').click

    expect(page).to have_content("0\nFollowings").twice
  end
end
