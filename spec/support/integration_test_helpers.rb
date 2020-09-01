module IntegrationTestHelpers
  def do_signup(username, fullname, email)
    visit root_path
    click_link('Sign up')
    fill_in('Username', with: username)
    fill_in('Fullname', with: fullname)
    fill_in('Email', with: email)
    click_button('Sign up')
  end

  def do_login(username)
    visit root_path
    fill_in('Username', with: username)
    click_button('Log in')
  end

  def do_logout
    visit root_path
    find('.fa-sign-out-alt').click
  end
end
