FactoryGirl.define do
  factory :user do
  	name "say my name"
  	email "example@example.com"
  	password "password"
  	password_confirmation "password"
  end
end