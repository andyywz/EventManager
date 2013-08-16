require "spec_helper"

feature "User" do
  it "validates that the username is unique" do
    visit "/users/sign_up"
    sign_up_as_hello_world
  
    click_link "Logout"
    click_link "Create a New Account?"
    
    fill_in "user_fname", with: "new"
    fill_in "user_lname", with: "world"
    fill_in "user_username", with: "hello_world"
    fill_in "user_email", with: "test2@example.com"
    fill_in "user_password", with: "test"
    fill_in "user_password_confirmation", with: "test"
    click_button "Sign Up"
    
    page.should have_content "Username has already been taken"
    page.should have_button "Sign Up"
  end
end