require 'spec_helper'

describe "Profile Tests: " do
  let(:user) { FactoryGirl.create(:user) }

  describe "Admin should choose a field and set all the roles: " do

    describe "Anonymous User: " do
      it "Should not see the Profiles page" do
        visit profiles_path
        expect(page).to have_content("You need to sign in to see this page.")
      end
    end

    describe "Authenticated User: " do
      before(:each) do
        sign_in(user)
      end

      it "Should be able to view the index page" do
        visit profiles_path
        expect(page).to have_content("Profiles")
      end

      #
      #it "Should be able to edit a profile " do
      #  sign_in(@user)
      #  visit "/profiles/#{@testuser.id}/edit"
      #  expect(page).to have_content('Edit User Profile')
      #  select "Superuser", :from => "profile_main_role"
      #  click_button("Update User")
      #  expect(page).to have_content('The profile was updated with roles Superuser, Behavioralanalytics, Clientadviseradmin, Clientadviser, Refinery')
      #end
      #
      #it "Should have only EndUser roles" do
      #  sign_in(@user)
      #  visit "/profiles/#{@testuser.id}/edit"
      #  expect(page).to have_content('Edit User Profile')
      #  select "Enduser", :from => "profile_main_role"
      #  click_button("Update User")
      #  expect(page).to have_content('The profile was updated with roles Enduser')
      #end
      #
      #it "Client Adviser Admin should not be able to edit higher roles" do
      #  sign_in(@user_client_adviser_roles)
      #  visit "/profiles/#{@user.id}/edit"
      #  expect(page).to have_content('You do not have permission to edit this person')
      #end
      #
      #it "Client Adviser Admin should higher role needed on some lines to limit access to who they can edit" do
      #  sign_in(@user_client_adviser_roles)
      #  # move into new it block
      #  visit "/profiles"
      #  expect(page).to have_content('Higher Role Needed')
      #end
      #
      #it "Client Adviser Admin should only see Clientadviser and Enduser in the select list and not the others" do
      #  sign_in(@user_client_adviser_roles)
      #  visit "/profiles/#{@testuser.id}/edit"
      #  expect(page).to have_content('Edit User Profile')
      #  page.has_select?('Select the Main Role', :with_options => ["Enduser", "Clientadviser"])
      #  page.has_no_select?('Select the Main Role', :with_options => ["Superuser"])
      #  select "Enduser", :from => "profile_main_role"
      #  click_button("Update User")
      #  expect(page).to have_content('The profile was updated with roles Enduser')
      #end
      #
      #it "Should not let an end user see other profiles" do
      #  sign_in(@testuser)
      #  visit profiles_path
      #  expect(page).to have_content('Sorry, you do not have permissions to see that page.')
      #end
      #
      #it "Should not let anonymous user see other profiles" do
      #  visit profiles_path
      #  expect(page).to have_content('Sorry, you need to login to see this page')
      #end
      #
      #it "Remove a user should remove the profile" do
      #  sign_in(@user)
      #  expect { @testuser.delete }.to change(User, :count).by(-1)
      #end

    end
  end
end