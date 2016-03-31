require 'rails_helper'
RSpec.describe LinksController, type: :controller do
  describe "#delete" do
    it "gets the path" do
      link = create(:link)
      get :delete, id: link.id

      expect(flash[:error]).to eq "Link has been deleted"
    end
  end

end
