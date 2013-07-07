require 'spec_helper'

feature "Signing up" do
	scenario "Successful sign up" do
	  visit '/'

	  click_link "Sign up"
	  fill_in "Username", with: "username"
	  fill_in "Email", with: "user@example.com"
	  fill_in "user[password]", with: "password"
	  fill_in "user[password_confirmation]", with: "password"
	  click_button "Create User"

	  expect(page).to have_content("You have signed up successfully.")
	end
end