# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before do
    cur_user
  end

  it 'signs up' do
    visit root_path
    click_link('Sign up')
    fill_in('Username', with: "mock_username")
    fill_in('Fullname', with: "mock_fullname")
    fill_in('Email', with: "mock@email.com")
    find("input[value='Sign Up']").click

    expect_snapshot_match("sign_up")
    expect(page).to have_content "mock_fullname"
  end

  it 'logs in' do
    visit root_path
    fill_in('Username', with: cur_user.username)
    click_button('Log in')
    
    expect_snapshot_match("log_in")
    expect(page).to have_content cur_user.fullname
  end

  it 'logs out' do
    sign_in cur_user
    visit root_path
    
    within "header" do
      find('.bi-box-arrow-right').click  
    end

    expect_snapshot_match("log_out")
    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Username'
    expect(page).to have_content 'Sign up'
  end
end
