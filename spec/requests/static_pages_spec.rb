require 'spec_helper'

describe "Static Pages: " do
    #
    #before do
    #  #@user = FactoryGirl.create(:user, :email => Faker::Internet.email)
    #  #@user_other = FactoryGirl.create(:user, :email => Faker::Internet.email)
    #  #Refinery::Page.create!(:title => 'est', :link_url => '/', :slug => "home", :show_in_menu => true)
    #end

    describe "Anonymous User" do
      it "Should see Dashboard" do
        visit '/dashboard'
        expect(page).to have_content('You need to sign in to see this page.')
      #     sign_up_for_site
      # 	  expect(page).to have_content('Welcome! You have signed up successfully.')
      # 	  expect(page).to have_content('Test 1')
      # 	  ActionMailer::Base.deliveries.last
      # 	  ActionMailer::Base.deliveries = []
      end
    end

    #before(:each) do
    #
    #end
    #
    #after(:all) do
    #	User.delete_all
    #	SurveySet.delete_all
    #end

    #describe "User can update Profile" do
    #  it "Should allow user to edit the form" do
    #    visit '/users/edit'
    #    expect(page).to have_content('Edit User')
    #    fill_in 'user_first_name', :with => "Test First Name new"
    #    fill_in 'user_current_password', :with => 'password'
    #    click_button "Update"
    #    expect(page).to have_content('You updated your account successfully.')
    #  end
    #end


    #describe "User can update Password" do
    #  it "Should be able to update password" do
    #    visit edit_user_registration_path(@user)
    #    expect(page).to have_content('Edit User')
    #    fill_in 'user_password', :with => "password1"
    #    fill_in 'user_password_confirmation', :with => 'password1'
    #    fill_in 'user_current_password', :with => 'password'
    #    click_button "Update"
    #    click_link "Logout"
    #    visit user_session_path
    #    fill_in 'user_email', :with => @user.email
    #    fill_in 'user_password', :with => "password1"
    #    click_button "Sign in"
    #    expect(page).to have_content("Welcome")
    #  end
    #end

  describe "Authenticated User Tests" do
    let(:user) { FactoryGirl.create(:user) }
    before do
        sign_in(user)
      end

      it "Check that user sees welcome message " do
        expect(page).to have_content('Signed in successfully.')
      end

  #
  #
  #    #describe "User needs unique email" do
  #    #  it "Should not let them sign up" do
  #    #    click_link "Logout"
  #    #    visit  new_user_registration_path
  #    #    fill_in "user_email", :with => @user.email
  #    #    fill_in "user_password", :with => 'welcome'
  #    #    fill_in "user_password_confirmation", :with => 'welcome'
  #    #    click_button "Sign up"
  #    #    expect(page).to have_content('Email has already been taken')
  #    #  end
  #    #end
  end
end