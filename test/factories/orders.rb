FactoryGirl.define do 
  factory :order do
    firstname  "Tim"
    lastname  "Smith"
    street_address "123 Way Street"
    city "Vancouver"
    state "Washington" 
    zipcode 95555
    country "United States"
    email "tim@example.org"
    telephone "555-555-5555"
    status 'Submitted'
    zipcode 95555
    company 'NetworkGeeks'
    association :user
  end
  
end