require "rails_helper"

RSpec.describe Link, type: :model do
  it "has a valid factory" do
    expect(build(:link)).to be_valid
  end

  let(:link) { create(:link) }

  context "respond to instance method calls" do
    it { expect(link).to respond_to(:visits) }
    it { expect(link).to respond_to(:actual_url) }
    it { expect(link).to respond_to(:short_url) }
    it { expect(link).to respond_to(:actual_url) }
    it { expect(link).to respond_to(:user_id) }
  end

  describe "#generate_short_url" do
    it "generates a shortened url" do
      link.generate_short_url
      expect(link.short_url).to be_a String
      link.destroy
    end
  end
end
