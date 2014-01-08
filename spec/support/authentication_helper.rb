module AuthenticationHelper
  def sign_in_as(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
    expect(page).to have_content('Edit Profile')
  end

  # def create_enrollment_environment(student, teacher)
  #   subject = FactoryGirl.create(:classroom, name: 'Biology', user_id: teacher.id)
  #   FactoryGirl.create(:enrollment, classroom_id: subject.id, user_id: student.id)
  # end
end
