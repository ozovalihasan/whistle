# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'QuotedWhiistle', type: :feature do
  include ActionView::RecordIdentifier 
  include ApplicationHelper 
  
  before do
    sign_in cur_user
    user
  end

  let(:inactive_button_css) { "div.text-first" } 
  let(:active_button_css) { "div.text-second" } 

  it 'is created by click a button shown under whiistles' do
    whiistle = create(:mock_whiistle, user: user, id: 100)
    
    visit user_whiistles_path(user)
    rewhiistle_and_quote_button = find("#user-tabs div.#{whiistle_rewhiistle_or_quote_button_target(whiistle)}")
    rewhiistle_and_quote_button.click

    quoting_whiistle_button = find("#user-tabs a[href='#{new_whiistle_quoted_whiistle_path(whiistle)}']")
    quoting_whiistle_button.click

    modal_body = find('#modal_body')
    
    within modal_body do
      find('#whiistle_body')
      expect(page).not_to have_content 'mock whiistle body'
      
      fill_in('whiistle_body', with: 'mock whiistle body')

      click_button "Whiistle", exact: true
    end

    expect_snapshot_match
    expect(modal_body).to have_content 'mock whiistle body'
  end
end
