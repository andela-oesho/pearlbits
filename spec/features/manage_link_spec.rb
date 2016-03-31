require "rails_helper"
describe "managing a link", type: :feature do
  after(:all) do
    Link.destroy_all
  end
  context "setting a link to inactive" do
    it "updates the status of a link", js: true do
      OmniAuth.config.test_mode = true
      visit("/")
      click_link("Login")
      click_link("Sign in with Facebook")
      fill_in("link[actual_url]", with: "facebook.com")
      fill_in("link[vanity]", with: "persons")
      click_button("Shorten Url")
      link = Link.last
      expect(page).to have_content "edit"
      click_link("edit")
      expect(page).to have_current_path "/"

    end
  end
end
