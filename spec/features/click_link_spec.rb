require "rails_helper"
describe "clicking a link", type: :feature do
  after(:all) do
    Link.destroy_all
  end
  context "clicking an active link" do
    it "shortens a link based on the link id of the link created", js: true do
      visit("/")
      expect(page).to have_content "leading link shortener built with rails...."
      fill_in("link[actual_url]", with: "facebook.com")
      click_button("PearlBit!")
      link = Link.last

      visit("/#{link.short_url}")
      expect(current_url).to eq "https://www.facebook.com/"
    end
  end
end
