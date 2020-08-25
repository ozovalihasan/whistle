require 'rails_helper'

RSpec.describe 'user', type: :system do
  before :each do
    User.create([{ username: 'hillary', fullname: 'Hillary Kiptoo', email: 'hillary@email.com', password: 'aaaaaa', password_confirmation: 'aaaaaa' },
                 { username: 'hasan', fullname: 'Hasan Ozovali', email: 'hasan@email.com', password: 'aaaaaa', password_confirmation: 'aaaaaa' }])
  end

  it 'signs up ' do
    do_signup('jackie', 'Jackie Chan', 'jackie@email.com')
    expect(page).to have_content 'Jackie Chan'
  end

  it 'logs in ' do
    do_login('hasan')
    expect(page).to have_content 'Hasan Ozovali'
  end

  it 'logs out ' do
    do_login('hasan')
    do_logout
    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Username'
    expect(page).to have_content 'Sign up'
  end
end
