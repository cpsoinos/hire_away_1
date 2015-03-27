require 'rails_helper'

feature 'user registers', %Q{
  As a visitor
  I want to register
  So that I can create an account
} do

  let!(:user) { FactoryGirl.create(:user) }
  # Acceptance Criteria:
  # * I must specify a valid email address,
  #   password, and password confirmation
  # * If I don't specify the required information, I am presented with
  #   an error message

  scenario 'provide valid registration information' do
    visit new_user_registration_path

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Street address', with: user.street_address
    fill_in 'user_street_address2', with: user.street_address2
    fill_in 'City', with: user.city
    select 'Massachusetts', from: 'user_state'
    fill_in 'Zip', with: user.zip
    fill_in 'Phone', with: user.phone

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provide invalid registration information' do
    visit new_user_registration_path

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end
end
