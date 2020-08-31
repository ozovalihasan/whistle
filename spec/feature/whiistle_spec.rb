require 'rails_helper'

RSpec.describe 'whiistle', type: :system do
  before :each do
    User.create([{ username: 'hillary', fullname: 'Hillary Kiptoo', email: 'hillary@email.com',
                   password: 'aaaaaa', password_confirmation: 'aaaaaa' },
                 { username: 'hasan', fullname: 'Hasan Ozovali', email: 'hasan@email.com',
                   password: 'aaaaaa', password_confirmation: 'aaaaaa' }])
  end

  it 'is created by using form on the index page of whiistles' do
    do_login('hasan')
    fill_in('whiistle_body', with: 'Hi everyone')
    click_button('Whiistle')

    expect(page).to have_content 'Hi everyone'
  end

  it 'is created by using form on the show page of users' do
    do_login('hasan')

    find('a', text: '@hillary').click
    fill_in('whiistle_body', with: 'hi @hillary')
    click_button('Whiistle')
    expect(page).to have_content 'You whiistled'
  end
end
