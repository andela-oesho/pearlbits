require 'rails_helper'
require "faker"
RSpec.describe User, type: :model do
  before do
    User.destroy_all
  end
  after do
    User.destroy_all
  end
  def credentials
    token = Faker::Number.number(6)
    { token: token, expires_at: Time.now + 1.week, secret: "mysecret" }
  end

  def facebook_auth
    OmniAuth.config.add_mock(
      :facebook,
      uid: 1234,
      nickname: "neski",
      info: {
        first_name: "susan",
        last_name:  "esho",
        email:      "susan@example.com"
      },
      credentials: credentials,
      extra: {
        raw_info: { gender: "female" }
      }
    )
  end

  it "creates a new user with oauth information" do
    User.from_omniauth(facebook_auth)
    expect(User.last.uid).to eq "1234"
  end

end
