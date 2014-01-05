require 'spec_helper'

feature 'user sign up', %Q{
  As a user,
I want to create an account
So that class time is more purposeful.
} do
# Acceptance Criteria
# * I must specify an email address, my school, grade/subject, a first name, a last name, a password, and a password confirmation
# * If I do not specify the required fields, I receive an error message
# * I need to select that I am a type teacher or a student
# * If I specify all the required information I can access the system to create flipped homework
# * If I do not specify all the required fields, I can’t access the system to create flipped homework
# * I must specify a valid email
# * My password confirmation must match my specified password

  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Smith'
    select 'Student', from: 'I am a ...'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password345'
    fill_in 'Password confirmation', with: 'password345'
    save_and_open_page
    click_button 'Sign Up'

    expect(page).to have_content('You have successfully signed up!')
    expect(page).to have_content('Sign Out')
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'password and password confirmation do not match' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'somethingElse'
    click_button 'Sign Up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content('Sign Out')
  end
end
