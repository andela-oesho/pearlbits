require "rails_helper"
describe "Shortening a link", type: :feature do
  context "anonymous_user" do
    it "shortens a link based on the link id of the link created", js: true do
      visit("/")
      expect(page).to have_content "leading link shortener built with rails...."
      fill_in("link[actual_url]", with: "facebook.com")
      click_button("PearlBit!")
      expect(Link.first.actual_url).to eq "http://facebook.com"
      expect(Link.all.count).to be 1
      Link.destroy_all
    end
  end
  context "registered_user" do
    Link.destroy_all
    it "shortens link" do
      OmniAuth.config.test_mode = true
      visit("/")
      click_link("Login")
      click_link("Sign in with Twitter")
      expect(page).to have_current_path("/dashboard")
      fill_in("link[actual_url]", with:  "futballtori.com")
      click_button("Shorten Url")
      expect(Link.first.actual_url).to eq "http://futballtori.com"
      expect(Link.all.count).to be 1
    end
  end
end
