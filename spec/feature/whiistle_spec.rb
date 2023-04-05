# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'whiistle', type: :feature do
  before :all do
    page.driver.browser.manage.window.resize_to(1365, 682)
  end

  before do
    sign_in cur_user
    user
  end

  let(:whiistle_by_pressing_button) do
    find('textarea').click

    within '#modal_body' do
      find_by_id('whiistle_body')
      expect(page).not_to have_content 'mock whiistle body'

      fill_in('whiistle_body', with: 'mock whiistle body')

      page.attach_file(Rails.root.join('app', 'assets', 'images', 'mock-1.jpg')) do
        page.find('.bi-images').click
      end

      click_button 'Whiistle', exact: true
    end
  end

  let(:expect_whiistle_created_correctly) do
    within '#modal_body' do
      expect(page).to have_content 'mock whiistle body'
      expect(page).to have_css('img').exactly(2).times
    end
  end

  it 'is created by using a form on the index page of whiistles' do
    visit whiistles_path

    whiistle_by_pressing_button

    expect(page).to have_current_path(whiistles_path)
    expect_snapshot_match('index_page_of_whiistles')
    expect_whiistle_created_correctly
  end

  it 'is created by using a form on the index page of whiistles of a user' do
    visit user_whiistles_path(user)

    whiistle_by_pressing_button

    expect_snapshot_match('index_page_of_whiistles_of_a_user')
    expect_whiistle_created_correctly
  end

  it 'is created by using a form on the index page of whiistles with replies of a user' do
    visit user_whiistles_with_replies_path(user)

    whiistle_by_pressing_button

    expect_snapshot_match('index_page_of_whiistles_with_replies_of_a_user')
    expect_whiistle_created_correctly
  end
end
