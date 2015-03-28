require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    street_address Faker::Address.street_address
    street_address2 Faker::Address.secondary_address
    city Faker::Address.city
    state Faker::Address.state_abbr
    zip Faker::Address.zip
    phone Faker::PhoneNumber.cell_phone
  end
  #
  # factory :admin do
  #   sequence(:email) { |n| "user#{n}@example.com" }
  #   password 'password'
  #   password_confirmation 'password'
  #   first_name Faker::Name.first_name
  #   last_name Faker::Name.last_name
  #   street_address Faker::Address.street_address
  #   street_address2 Faker::Address.secondary_address
  #   city Faker::Address.city
  #   state Faker::Address.state_abbr
  #   zip Faker::Address.zip
  #   phone Faker::PhoneNumber.cell_phone
  #   admin true
  # end

  factory :event do
    sequence(:name) { |n| "#{Faker::Company.name} #{Faker::Company.suffix}#{n}" }
    description Faker::Lorem.sentence
    start_time Faker::Time.forward(23, :morning)
    end_time Faker::Time.forward(25, :evening)
    location
  end

  factory :location do
    name Faker::Company.name
    address Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state_abbr
    contact_name Faker::Name.name
    contact_phone Faker::PhoneNumber.cell_phone
    contact_email Faker::Internet.safe_email
  end


end
