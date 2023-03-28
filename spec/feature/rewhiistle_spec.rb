# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Rewhiistle', type: :feature do
  include ActionView::RecordIdentifier 
  include ApplicationHelper 
  
  before do
    sign_in cur_user
    user
  end

  let(:inactive_button_css) { "div.text-first" } 
  let(:active_button_css) { "div.text-second" } 

  it 'is created by click a button shown under whiistles' do
    whiistle = create(:mock_whiistle, user: user)
    
    visit user_whiistles_path(user)
    rewhiistle_and_quote_button = find("#user-tabs div.#{whiistle_rewhiistle_or_quote_button_target(whiistle)}")

    expect( rewhiistle_and_quote_button ).to have_content '0'
    expect( rewhiistle_and_quote_button ).to have_css inactive_button_css

    rewhiistle_and_quote_button.click
    rewhiistle_button = find("#user-tabs div.#{whiistle_rewhiistle_button_target(whiistle)}")

    expect( rewhiistle_button ).to have_css inactive_button_css

    rewhiistle_button.click
    rewhiistle_and_quote_button.click

    expect_snapshot_match("create")
    expect( rewhiistle_and_quote_button ).to have_content '1'
    expect( rewhiistle_button ).to have_css active_button_css
    expect( rewhiistle_and_quote_button ).to have_css active_button_css
  end
  
  it 'is destroyed by click a button shown under whiistles' do
    whiistle = create(:mock_whiistle, user: user)
    create(:mock_rewhiistle, user: cur_user)
    
    visit user_whiistles_path(user)
    rewhiistle_and_quote_button = find("#user-tabs div.#{whiistle_rewhiistle_or_quote_button_target(whiistle)}")

    expect( rewhiistle_and_quote_button ).to have_content '1'
    expect( rewhiistle_and_quote_button ).to have_css active_button_css

    rewhiistle_and_quote_button.click
    rewhiistle_button = find("#user-tabs div.#{whiistle_rewhiistle_button_target(whiistle)}")

    expect( rewhiistle_button ).to have_css active_button_css

    rewhiistle_button.click
    rewhiistle_and_quote_button.click

    expect_snapshot_match("destroy")
    expect( rewhiistle_and_quote_button ).to have_content '0'
    expect( rewhiistle_button ).to have_css inactive_button_css
    expect( rewhiistle_and_quote_button ).to have_css inactive_button_css
  end
end
