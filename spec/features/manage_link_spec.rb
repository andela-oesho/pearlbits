require "rails_helper"
describe "managing a link", type: :feature do
  def set_selenium_window_size(width, height)
    window = Capybara.current_session.driver.browser.manage.window
    window.resize_to(width, height)
  end
  after(:all) do
      Link.destroy_all
  end
  def login

    OmniAuth.config.test_mode = true
    visit("/")
    click_link("Login")
    click_link("Sign in with Facebook")
  end
  context "editing target url" do
    it "updates the target url", js:true do
      login
      set_selenium_window_size(1024, 768)
      fill_in("link[actual_url]", with: "facebook.com")
      fill_in("link[vanity]", with: "persons")
      click_button("Shorten Url")

      click_link("edit")
      fill_in("actual_url", with: "google.com")
      click_button("Update")

      expect(page).to have_content "Link Updated Successfully"
      expect(page).to have_content "google.com"
    end
  end
  context "viewing the details of a link" do
    it "shows the details of the link" do
      login
      click_link("Details")
      expect(page).to have_content "Ip Address"
      expect(page).to have_content "Browser_Information"
      expect(page).to have_content "Referer"
    end
  end
end
