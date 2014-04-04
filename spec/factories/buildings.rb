# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    name "High Towers"
    address "74 Holyrood Ave"
    city "Houston"
    state "MA"
    postalcode "02135"
    description "This building is sooooo talll!!!"
  end
end
