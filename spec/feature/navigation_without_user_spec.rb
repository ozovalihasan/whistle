# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Navigation', type: :feature do
  before :all do
    page.driver.browser.manage.window.resize_to(1365,682)
  end
  
  it 'opens the root path by logining' do
    user
    visit user_session_path

    within "#user-content" do
      fill_in("Username", with: user.username)
      click_button("Log in")
    end
      
    expect_snapshot_match("log_in_with_user")
    expect(page).to have_current_path(root_path)
  end
  
  it 'opens the root path by logining as guest' do
    create(:mock_user, username: "guest", fullname: "Guest")
    
    visit user_session_path

    within "#user-content" do
      click_button("Log in as guest")
    end
      
    expect_snapshot_match("log_in_as_guest")
    expect(page).to have_current_path(root_path)
    expect(find("#cur-user-left-side")).to have_text("Guest")
  end

  
end
