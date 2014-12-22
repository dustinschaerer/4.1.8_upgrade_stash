FactoryGirl.define do
  factory :user do
    email "tim@example.org"
    encrypted_password 'secretpassword'
    admin false
    password 'mypassword'
  end

end
