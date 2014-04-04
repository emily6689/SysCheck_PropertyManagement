# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    first_name "Emily"
    last_name "Williams"
    email "emily@williams.com"
    company "High Towers Corp."
  end
end
