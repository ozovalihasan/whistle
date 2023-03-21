# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'relation', type: :feature do
  before do
    FactoryBot.create_pair(:mock_user)
  end

  it 'A user can follow another user by using a button' do
    sign_in User.first
    visit root_path

    find('button', text: /^Follow$/).click

    expect(page).to have_content "1\nFollowings"
  end

  it 'A user can follow another user by using a button' do
    sign_in User.first
    visit root_path
    find('a', text: "@#{User.second.username}").click
    find('.bi-plus-circle').click

    expect(page).to have_content "1\nFollowings"
  end

  it 'A user can unfollow another user by using a button' do
    User.first.following_relations.create(followed_id: User.second.id)

    sign_in User.first
    visit user_whiistles_path(User.second)
    find('.bi-x').click

    expect(page).to have_content("0\nFollowings").twice
  end
end
