require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
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

end
