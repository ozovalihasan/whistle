# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Flood', type: :feature do
  before do
    sign_in cur_user
    user
  end

  it 'is created by using form on the index page of whiistles' do
    visit whiistles_path

    find('textarea').click

    within '#modal_body' do
      find_by_id('whiistle_body')

      click_on 'Add Flood', exact: true
      click_on 'Add Flood', exact: true

      all('textarea').each_with_index do |textarea, index|
        fill_in(textarea[:id], with: "mock whiistle body #{index}")
      end

      click_button 'Whiistle', exact: true
    end

    expect_snapshot_match('by_updating_body')
    expect(page).to have_content 'mock whiistle body 0'
    expect(page).to have_content 'mock whiistle body 1'
    expect(page).to have_content 'mock whiistle body 2'
  end

  it 'is created by using form on the index page of whiistles by quoting a whiistle' do
    whiistle = create(:mock_whiistle, body: 'mock quoted whiistle body')
    quoted_whiistle_url = whiistle_url(whiistle)
    visit whiistles_path

    find('textarea').click

    within '#modal_body' do
      find_by_id('whiistle_body')

      click_on 'Add Flood', exact: true, count: 2
      click_on 'Add Flood', exact: true

      all('textarea').each_with_index do |textarea, index|
        textarea.click
        fill_in(textarea[:id], with: "mock whiistle body #{index}")

        input = find("input[placeholder='Copy paste the link of a whiistle to quote']")
        fill_in(input[:id], with: quoted_whiistle_url)
      end

      click_button 'Whiistle', exact: true
    end

    expect_snapshot_match('by_adding_link')
    expect(page).to have_content 'mock whiistle body 0'
    expect(page).to have_content 'mock whiistle body 1'
    expect(page).to have_content 'mock whiistle body 2'
    expect(page).to have_content('mock quoted whiistle body').exactly(3).times
  end

  it 'is created by using form on the index page of whiistles by adding pictures' do
    visit whiistles_path

    find('textarea').click

    within '#modal_body' do
      find_by_id('whiistle_body')

      click_on 'Add Flood', exact: true
      click_on 'Add Flood', exact: true

      all('textarea').each_with_index do |textarea, index|
        textarea.click
        fill_in(textarea[:id], with: "mock whiistle body #{index}")
        page.attach_file(Rails.root.join('app', 'assets', 'images', 'avatar1.jpg')) do
          page.find('.bi-images').click
        end
      end

      click_button 'Whiistle', exact: true
    end

    expect_snapshot_match('by_adding_pictures')

    within '#modal_body' do
      expect(page).to have_content 'mock whiistle body 0'
      expect(page).to have_content 'mock whiistle body 1'
      expect(page).to have_content 'mock whiistle body 2'
      expect(page).to have_css('img').exactly(6).times
    end
  end
end
