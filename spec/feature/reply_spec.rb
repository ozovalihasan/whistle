# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reply', type: :feature do
  include ActionView::RecordIdentifier
  include ApplicationHelper

  before do
    sign_in cur_user
    user
  end

  it 'is created by click a button shown under whiistles' do
    whiistle = create(:mock_whiistle, user:)

    visit user_whiistles_path(user)

    reply_button = find("#user-tabs a span##{whiistle_reply_counter_target(whiistle)}")

    expect(reply_button).to have_content '0'

    reply_button.click

    within '#modal_body' do
      fill_in('reply_body', with: 'mock reply body')

      click_button 'Whiistle', exact: true
    end

    expect_snapshot_match

    within '#modal_body' do
      expect(page).to have_content 'mock reply body'
    end

    expect(reply_button).to have_content '1'
  end
end
