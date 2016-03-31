FactoryGirl.define do
  factory :link do
    actual_url "http://bitly.com"
    short_url "e"
    active true
    deleted false
    visits 0
    user_id 1
    vanity ""
  end
end
