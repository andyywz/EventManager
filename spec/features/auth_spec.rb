require "spec_helper"

feature "Sign up" do
  before :each do
    visit "/users/sign_up"
  end
  
  it "has a user sign up page" do
    page.should have_button "Sign Up"
  end
  
  it "takes a username and password" do
    page.should have_content "New Username"
    page.should have_content "Password"
    page.should have_content "Password confirmation"
  end
  
  it "validates the presence of the user's username, email and password" do
    fill_in "user_fname", with: "hello"
    fill_in "user_lname", with: "world"
    click_button "Sign Up"
    page.should have_button "Sign Up"
  end
  
  it "validates the presence of the user's first/last name" do
    fill_in "user_username", with: "hello_world"
    fill_in "user_email", with: "test@example.com"
    fill_in "user_password", with: "test"
    fill_in "user_password_confirmation", with: "test"
    click_button "Sign Up"
    page.should have_button "Sign Up"
  end
  
  it "logs the user in and redirects them to events index on success" do
    sign_up_as_hello_world
    page.should have_link "hello_world"
  end
end