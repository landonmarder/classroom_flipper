require 'spec_helper'

feature 'user updates profile' do
  # Acceptance Criteria
  # * I must click on update profile
  # * I am prompted to change any fields that I want
  # * Any changes to fields must be valid

  scenario 'an existing user changes information correctly' do
    user = FactoryGirl.create(:teacher)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    expect(page).to have_content("Welcome Back!")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
    expect(page).to have_content('Edit Profile')

    click_link 'Edit Profile'
    fill_in 'First name', with: 'New First'
    fill_in 'Last name', with: 'New Last'
    fill_in 'Email', with: "new-#{user.email}"
    fill_in 'Password', with: 'password34567'
    fill_in 'Password confirmation', with: 'password34567'
    fill_in 'Current password', with: user.password
    click_button 'Update'
    expect(page).to have_content('Thanks for keeping us updated!')
  end

  scenario 'an existing user changes information, but does not supply correct password' do
    user = FactoryGirl.create(:teacher)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    expect(page).to have_content("Welcome Back!")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
    expect(page).to have_content('Edit Profile')

    click_link 'Edit Profile'
    fill_in 'First name', with: 'New First'
    fill_in 'Last name', with: 'New Last'
    fill_in 'Email', with: "new-#{user.email}"
    fill_in 'Password', with: 'password34567'
    fill_in 'Password confirmation', with: 'password34567'
    fill_in 'Current password', with: "#{user.password}NOT"
    click_button 'Update'
    expect(page).to have_content('Current password is invalid')
  end

  scenario 'a non signed in user cannot edit a profile' do
    user = FactoryGirl.create(:teacher)
    visit new_user_session_path

    expect(page).to have_content('Sign In')
  end
end
