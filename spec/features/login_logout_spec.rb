require "rails_helper"
describe "login logout users", type: :feature do
  context "logging in a user" do
    it "should login a user and direct to Dashboard", js: true do
      OmniAuth.config.test_mode = true
      visit("/")
      click_link("Login")
      click_link("Sign in with Facebook")
      expect(page).to have_content "Welcome"
      expect(page).to have_content "Logout"
      expect(page).to have_content "My Dashboard"
    end
  end
  context "logging out a user" do
    it "logs out a user", js: true do
      OmniAuth.config.test_mode = true
      visit("/")
      click_link("Login")
      click_link("Sign in with Facebook")
      click_link("Logout")
      expect(page).to have_content "Login"
      expect(page).to have_current_path "/"
    end
  end
end
