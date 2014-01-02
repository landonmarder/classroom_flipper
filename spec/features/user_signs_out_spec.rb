require 'spec_helper'

feature 'user signs out' do
  # ACCEPTANCE CRITERIA
  # * I am a signed in user
  # * I must click on the sign out page
  # * I must click sign out
  # * I must be returned to the home page

  scenario 'an existing user signs out' do
    user = FactoryGirl.create(:teacher)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    expect(page).to have_content("Welcome Back!")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")

    click_link 'Sign Out'

    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Sign In")
  end

  scenario 'a user that is not authenticated cannot sign out' do
    visit root_path
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Sign Up")
  end
end
