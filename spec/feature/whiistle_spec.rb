# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'whiistle', type: :feature do
  before do
    sign_in cur_user
    user
  end

  let(:whiistle_by_pressing_button) do
    find('textarea').click

    within '#modal_body' do
      find('#whiistle_body')
      expect(page).not_to have_content 'mock whiistle body'
      
      fill_in('whiistle_body', with: 'mock whiistle body')

      click_button "Whiistle", exact: true
    end
  end

  it 'is created by using form on the index page of whiistles' do
    sign_in cur_user
    visit whiistles_path

    whiistle_by_pressing_button

    expect(page).to have_current_path(whiistles_path)
    expect_snapshot_match("index_page_of_whiistles")
    expect(page).to have_content 'mock whiistle body'
  end

  it 'is created by using form on the index page of whiistles of a user' do
    
    visit user_whiistles_path(user)

    whiistle_by_pressing_button

    expect_snapshot_match("index_page_of_whiistles_of_a_user")
    expect(page).to have_content 'mock whiistle body'
  end

  it 'is created by using form on the index page of whiistles with replies of a user' do
    
    visit user_whiistles_with_replies_path(user)

    whiistle_by_pressing_button

    expect_snapshot_match("index_page_of_whiistles_with_replies_of_a_user")
    expect(page).to have_content 'mock whiistle body'
  end
  
end
