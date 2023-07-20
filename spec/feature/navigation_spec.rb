# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Navigation', type: :feature do
  before :all do
    page.driver.browser.manage.window.resize_to(1365, 682)
  end

  before do
    user
    sign_in cur_user
  end

  it 'opens the edit page of the current user by clicking a button on the header' do
    visit root_path

    within 'header' do
      find('.bi-gear-fill').click
    end

    expect_snapshot_match('edit_user_from_header')
    expect(page).to have_current_path(edit_user_registration_path)
  end

  it 'opens a form to whiistle by clicking a button on the header' do
    visit root_path

    within 'header' do
      find('.bi-pencil-fill').click
    end

    expect_snapshot_match('new_whiistle_form_from_header')
    expect(find_by_id('modal_body')).to have_css '#whiistle_body'
  end

  it 'opens the root by clicking a button on the left sidebar of the current user' do
    visit user_whiistles_path(user)

    within '#cur-user-left-side' do
      find('a', text: 'HOME').click
    end

    expect_snapshot_match('root_path_from_the_left_sidebar')
    expect(page).to have_current_path(root_path)
  end

  it 'opens the whiistles page of the current_user by clicking a button on the left sidebar of the current user' do
    visit user_whiistles_path(user)

    within '#cur-user-left-side' do
      find('a', text: 'PROFILE').click
    end

    expect_snapshot_match('user_whiistles_path_from_the_left_sidebar')
    expect(page).to have_current_path(user_whiistles_path(cur_user))
  end

  it 'opens the whiistles page of the user by clicking the fullname of the owner of the whiistle' do
    create(:mock_whiistle, user:)
    create(:mock_relation, followed: user, following: cur_user)
    visit root_path

    within 'main' do
      find('a', text: user.fullname).click
    end

    expect_snapshot_match('user_whiistles_path_from_the_owner_of_whiistle')
    expect(page).to have_current_path(user_whiistles_path(user))
  end

  it 'opens the show page of the whiistle by clicking the body of the whiistle' do
    whiistle = create(:mock_whiistle, user:)
    create(:mock_relation, followed: user, following: cur_user)
    visit root_path

    within 'main' do
      find('a', text: 'mock_body_whiistle').click
    end

    expect_snapshot_match('whiistle_path_from_the_body_of_whiistle')
    expect(page).to have_current_path(whiistle_path(whiistle))
  end

  context 'changes tabs' do
    it 'opens the whiistles page of the user' do
      visit user_liked_whiistles_path(user)

      within 'main' do
        find('#user-tabs li a', text: 'Whiistles', exact_text: true).click
      end

      expect_snapshot_match('whiistles_page_of_a_user')
      expect(page).to have_current_path(user_whiistles_path(user))
    end

    it 'opens the whiistles with replies page of the user' do
      visit user_whiistles_path(user)

      within 'main' do
        find('#user-tabs li a', text: 'Whiistles & Replies', exact_text: true).click
      end

      expect_snapshot_match('whiistles_with_replies_page_of_a_user')
      expect(page).to have_current_path(user_whiistles_with_replies_path(user))
    end

    it 'opens the medias page of the user' do
      visit user_whiistles_path(user)

      within 'main' do
        find('#user-tabs li a', text: 'Media', exact_text: true).click
      end

      expect_snapshot_match('medias_page_of_a_user')
      expect(page).to have_current_path(user_medias_path(user))
    end

    it 'opens the liked whiistles page of the user' do
      visit user_whiistles_path(user)

      within 'main' do
        find('#user-tabs li a', text: 'Likes', exact_text: true).click
      end

      expect_snapshot_match('liked_whiistles_page_of_a_user')
      expect(page).to have_current_path(user_liked_whiistles_path(user))
    end

    it 'opens the following page of the user' do
      visit user_whiistles_path(user)

      within 'main' do
        find('#user-tabs li a', text: 'Following', exact_text: true).click
      end

      expect_snapshot_match('following_page_of_a_user')
      expect(page).to have_current_path(user_followings_path(user))
    end

    it 'opens the follower page of the user' do
      visit user_whiistles_path(user)

      within 'main' do
        find('#user-tabs li a', text: 'Followers', exact_text: true).click
      end

      expect_snapshot_match('followers_page_of_a_user')
      expect(page).to have_current_path(user_followers_path(user))
    end
  end
end
