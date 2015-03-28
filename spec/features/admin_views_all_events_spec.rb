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
  user = FactoryGirl.create(:user)
  user.admin = true
  let!(:admin) { user }

  scenario 'admin views list of events' do

    visit events_path

    expect(page).to have_content(event.name)
    expect(page).to have_content(event.location.name)
  end

end
