FactoryGirl.factories.clear

FactoryGirl.define do

  factory :user do
  #  now = Time.now.to_i
  email Faker::Internet.email
  #  first_name Faker::Name.name
  #  last_name Faker::Name.name
  #  zipcode Faker::Address.zip_code
  #  phone Faker::PhoneNumber.phone_number
  password "welcometest"
  #  password_confirmation "password"
  #
  #  factory :user_with_roles do
  #    after_create do |user|
  #    end
  #  end
  #
  end

end
