require 'spec_helper'

feature 'user sign up', %Q{
  As a teacher,
I want to create an account
So that I can create and analyze data from a flipped homework assignment to make class time more purposeful.
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
    select 'Student', from: 'I am a . . .'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'user-password', with: 'password345'
    fill_in 'Password confirmation', with: 'password345'
    click_button 'Sign up'

    expect(page).to have_content('You have successfully signed up!')
    expct(page).to have_content('Sign Out')
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

    fill_in 'user-password', with: 'password'
    fill_in 'Password Confirmation', with: 'somethingElse'
    click_button 'Sign Up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content('Sign Out')
  end
end
