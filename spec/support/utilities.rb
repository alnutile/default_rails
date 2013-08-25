include ApplicationHelper

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: 'Invalid')
  end
end

def sign_out
  click_link "Sign out"
end

def sign_in(user)
  visit '/users/sign_in'
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara.
  # cookies[:remember_token] = user.remember_token
end

def sign_up_for_site
  fill_in "Email",    with: "test100@test.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  fill_in "Zipcode", with: "password"
  fill_in "Phone", with: "777777777"
  fill_in "First name", with: "Test 1"
  fill_in "Last name", with: "Test 2"
  click_button "Sign up"
end

def send_message(user)
  fill_in "Message", with: "Lorem..."
  click_button "Send Message"
end