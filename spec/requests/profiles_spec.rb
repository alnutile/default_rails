require 'spec_helper'

describe "Profile Tests: " do
  let(:user) { FactoryGirl.create(:user) }
  let(:testuser) { FactoryGirl.create(:user, :email => Faker::Internet.email) }

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
        expect(page).to have_content("Manage Users")
      end

      #
      it "Should be able to edit a profile " do
        visit "/profiles/#{testuser.id}/edit"
        expect(page).to have_content('Edit User Profile')
        click_button("Update User")
        expect(page).to have_content('The profile was updated.')
      end

      it "Should be able to change email " do
        visit "/profiles/#{testuser.id}/edit"
        fill_in "Email", with: "testemail@example.com"
        click_button("Update User")
        expect(page).to have_content("testemail@example.com")
      end

      it "Should be able to add user" do
        visit new_profile_path
        fill_in "Email", with: "testadd@example.com"
        fill_in "Password", with: "welcome2013"
        fill_in "Password confirmation", with: "welcome2013"
        click_button("Create User")
        expect(page).to have_content("testadd@example.com")
      end

      it "Should allow user to be deleted" do
        visit profiles_path
        id = User.last.id
        expect do
          find("a.user-#{id}").click
        end.to change(User, :count).by(-1)
      end

    end
  end
end