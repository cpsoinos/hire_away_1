require 'rails_helper'

feature 'admin adds new event', %Q{
  As an admin
  I want to create a new event
  So that I can plan what I need for it
} do
  # Acceptance Criteria
  # * If I'm signed in as an admin, I want to create a new event
  # * I want to choose a previous location or add a new one
  # * I want to choose which positions I need to hire for the event
  # * I want to select how many of each position I want to hire
  # * I want to view a list of users I can offer this job to
  # * I want to select which users I want to offer this job to
  # * I don't want to be able to select users currently on this or another event
  # * After creating the event, I want to see its details

  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:event) { FactoryGirl.create(:event) }
  before :each do
    sign_in admin
  end

  scenario 'admin views new event page' do
    visit new_event_path

    expect(page).to have_content("Name")
    expect(page).to have_content("Description")
    expect(page).to have_content("Start time")
    expect(page).to have_content("End time")
  end

  scenario 'admin provides valid information' do
    visit new_event_path
    fill_in "Name", with: event.name
    fill_in "Description", with: event.description
    select "Park Plaza Castle", from: "location"
    select "2015", from: "event_start_time_1i"
    select "April", from: "event_start_time_2i"
    select "26", from: "event_start_time_3i"
    select "12 AM", from: "event_start_time_4i"
    select "00", from: "event_start_time_5i"
    select "2015", from: "event_end_time_1i"
    select "April", from: "event_end_time_2i"
    select "27", from: "event_end_time_3i"
    select "11 AM", from: "event_end_time_4i"
    select "00", from: "event_end_time_5i"
    click_button "Create Event"

    expect(page).to have_content("Event created!")
  end

  scenario 'admin provides valid information' do
    visit new_event_path
    click_button "Create Event"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Location can't be blank")
  end
end

def sign_in(admin)
  visit new_user_session_path
  fill_in "Email", with: admin.email
  fill_in "Password", with: admin.password
  click_on "Log in"
end
