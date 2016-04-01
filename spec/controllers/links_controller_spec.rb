require "rails_helper"
require_relative "../support/login_helper"
RSpec.describe LinksController, type: :controller do
  include LoginHelper
  after do
    User.destroy_all
    Link.destroy_all
  end
  describe "#delete" do
    it "deletes a link" do
      login
      create(:user)
      link = create(:link)
      get :delete, id: link.id
      expect(flash[:error]).to eq "Link has been deleted"
    end
  end
  describe "#exist" do
    it "checks if a url already exist" do
      login
      create(:user)
      create(:link, vanity: "happy")
      post :create_url, link: { actual_url: "facebook.com", vanity: "happy" }
      expect(flash[:error]).to eq "Custom URL already exists"
    end
  end

  describe "visiting a deleted link" do
    it "renders a deleted error template" do
      link = create(:link, short_url: "h", deleted: true)
      get :handle_short_url, short_url:  link.short_url
      expect(response).to render_template(:deleted_error)
    end
  end

  describe "visiting an inactive link" do
    it "renders an inactive link template" do
      link = create(:link, short_url: "j", active: false)
      get :handle_short_url, short_url:  link.short_url
      expect(response).to render_template(:inactive_error)
    end
  end
  describe "#update" do
    it "updates the status of a link" do
      login
      create(:user)
      link = create(:link, short_url: "k")
      post :update, id: link.id, active: "inactive"
      expect(flash[:update]).to eq "Link Updated Successfully"
    end
  end
end
