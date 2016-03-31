require 'rails_helper'

RSpec.describe PageController, type: :controller do
  describe "navigating to dashboard" do
    context "when a user is not signed in"do
    it "rediredcts to roothpath" do
      get :dashboard
      expect(response).to redirect_to "/"
    end
  end
end

end
