FactoryGirl.define do 
  factory :user do
    email "thisguy@thisplace.com"
    encrypted_password 'secretpassword'
    admin false
    password 'mypassword'
  end
  
end
