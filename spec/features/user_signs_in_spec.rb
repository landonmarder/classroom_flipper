require 'spec_helper'

feature 'user signs in', %Q{
  As a user,
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
