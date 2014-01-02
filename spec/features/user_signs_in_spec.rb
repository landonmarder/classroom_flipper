require 'spec_helper'

feature 'user signs in' do
  # Acceptance Criteria
  # * I must navigate to the log in page/area
  # * My email and password must match
  # * Successful sign in goes to appropriate page (assignment list for teacher or classroom feed for students)
  # * Unsuccessful sign in asks user to sign in again

  scenario 'an existing user specifies a valid email and password' do
    user = FactoryGirl.create(:teacher)
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    expect(page).to have_content("Welcome Back!")
    expect(page).to have_content("Sign Out")
  end

  scenario 'a nonexistent email and password is supplied' do
    visit root_path
    click_link 'Sign In'

    click_button 'Sign In'
    fill_in 'Email', with: 'nobody@example.com'
    fill_in 'Password', with: 'password'

    click_button 'Sign In'
    expect(page).to_not have_content("Welcome Back!")
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content('Invalid email or password.')
  end

  scenario 'a existing email with the wrong password is denied access'

  scenario 'an already authenticated user cannot re-sign in'
end
