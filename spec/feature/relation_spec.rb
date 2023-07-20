# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'relation', type: :feature do
  before do
    sign_in cur_user
    user
  end

  it 'The current user can follow another user by using a button on the part "Who To Follow"' do
    visit root_path

    within '#cur-user-left-side' do
      expect(page).to have_content("0\nFollowing").once
    end

    within '#who-to-follow' do
      find('button', text: 'Follow').click
    end

    within '#cur-user-left-side' do
      expect(page).to have_content("1\nFollowing").once
    end
  end

  it 'The current user can follow another user by using a button on the right sidebar' do
    visit user_whiistles_path(user)

    within '#cur-user-left-side' do
      expect(page).to have_content("0\nFollowing").once
    end

    within '#user-sidebar-right' do
      find('.bi-plus-circle').click
    end

    within '#cur-user-left-side' do
      expect(page).to have_content("1\nFollowing").once
    end
  end

  it 'The current user can follow another user by using a button on the followings page of a user' do
    user.followings << create(:mock_user)

    visit user_followings_path(user)

    within '#cur-user-left-side' do
      expect(page).to have_content("0\nFollowing").once
    end

    within '#user-tabs' do
      find('button', text: 'Follow').click
    end

    within '#cur-user-left-side' do
      expect(page).to have_content("1\nFollowing").once
    end
  end

  it 'The current user can unfollow another user by using a button on the right sidebar' do
    cur_user.followings << user
    cur_user.reload

    visit user_whiistles_path(user)

    within '#cur-user-left-side' do
      expect(page).to have_content("1\nFollowing").once
    end

    within '#user-sidebar-right' do
      expect(page).to have_content("1\nFollowers").once

      find('.bi-x').click

      expect(page).to have_content("0\nFollowers").once
    end

    within '#cur-user-left-side' do
      expect(page).to have_content("0\nFollowing").once
    end
  end
end
