FactoryGirl.define do
  factory :link do
    actual_url "http://bitly.com"
    active true
    deleted false
    visits 0
    user_id 3
    vanity ""
  end
end
