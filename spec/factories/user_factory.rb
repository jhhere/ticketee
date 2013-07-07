FactoryGirl.define do
  factory :user do
  	name "username"
  	email "sample@example.com"
  	password "password"
  	password_confirmation "password"

  	factory :admin_user do
      admin true
  	end
  end
end