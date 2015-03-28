require 'rails_helper'

feature 'admin views events', %Q{
  As an admin
  I want to go to an index page
  So that I can see all current and future events
} do
  # Acceptance Criteria
  # * If I'm signed in as an admin, I want to see all current and future events
  # * I want to see an option to make a new event
  # * I want to see each event name
  # * I want to see each event location
  # * I want to see each event start time
  # * I want to see each event end time

  let!(:admin) { FactoryGirl.create(:user).update_attribute :admin, true }
  let!(:event) { FactoryGirl.create(:event) }
  before :each do
    sign_in admin
  end

  scenario 'admin views list of events' do
    visit events_path

    expect(page).to have_content(event.name)
    expect(page).to have_content(event.location.name)
  end

  scenario 'admin wants to add a new event' do
    visit events_path

    expect(page).to have_content("Add event")
end

def sign_in(admin)
  visit new_user_session_path
  fill_in "Email", with: admin.email
  fill_in "Password", with: admin.password
  click_on "Log in"
end
