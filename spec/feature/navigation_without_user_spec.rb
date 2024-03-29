# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Navigation', type: :feature do
  before :all do
    page.driver.browser.manage.window.resize_to(1365, 682)
  end

  it 'opens the root path by logging in' do
    user
    visit user_session_path

    within '#user-content' do
      fill_in('Username', with: user.username)
      click_button('Log in')
    end

    expect_snapshot_match('log_in_with_user')
    expect(page).to have_current_path(root_path)
  end

  it 'opens the root path by logging in as guest' do
    create(:mock_user, username: 'guest', fullname: 'Guest')

    visit user_session_path

    within '#user-content' do
      click_button('Log in as guest')
    end

    expect_snapshot_match('log_in_as_guest')
    expect(page).to have_current_path(root_path)
    expect(find_by_id('cur-user-left-side')).to have_text('Guest')
  end

  it 'signs up a new user' do
    visit user_session_path

    within '#user-content' do
      click_link('Sign up')
      fill_in('Username', with: 'new_user')
      fill_in('Fullname', with: 'New User')
      fill_in('Email', with: 'new_user@email.com')
      click_button('Sign Up')
    end

    expect_snapshot_match('sign_up')
    expect(page).to have_current_path(root_path)
    expect(find_by_id('cur-user-left-side')).to have_text('New User')
    expect(User.count).to be 1
  end
end
