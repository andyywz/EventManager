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
    page.should have_content "Username can't be blank" 
    page.should have_content "Email can't be blank"
    page.should have_content "Password can't be blank"
    page.should have_button "Sign Up"
  end
  
  it "validates the presence of the user's first/last name" do
    fill_in "user_username", with: "hello_world"
    fill_in "user_email", with: "test@example.com"
    fill_in "user_password", with: "test"
    fill_in "user_password_confirmation", with: "test"
    
    click_button "Sign Up"
    page.should have_content "Fname can't be blank"
    page.should have_content "Lname can't be blank"
    page.should have_button "Sign Up"
  end
  
  it "validates that the password is at least 4 characters long" do
    fill_in "user_fname", with: "hello"
    fill_in "user_lname", with: "world"
    fill_in "user_username", with: "hello_world"
    fill_in "user_email", with: "test@example.com"
    fill_in "user_password", with: "abc"
    fill_in "user_password_confirmation", with: "abc"
    
    click_button "Sign Up"
    page.should have_content "Password is too short"
    page.should have_button "Sign Up"
  end
  
  it "logs the user in and redirects them to events index on success" do
    sign_up_as_hello_world
    
    page.should have_content "Welcome! You have signed up successfully."
    page.should have_link "hello_world"
  end
end

feature "Logout" do
  it "has a logout button" do
    sign_up_as_hello_world
    page.should have_link "Logout"
  end
  
  it "logs a user out on click" do
    sign_up_as_hello_world
    
    click_link "Logout"
    
    page.should have_link "Login"
    page.should have_link "Create a New Account?"
  end
end

feature "Login" do
  it "has a login page" do
    visit "/users/sign_in"
    page.should have_button "Login"
  end
  
  it "takes a username/email and password" do
    visit "/users/sign_in"
    page.should have_content "Username or Email"
    page.should have_content "Password"
  end
 
  it "returns to login on failure" do
    visit "/users/sign_in"
    fill_in "Username", with: "hello_world"
    fill_in "Password", with: "hello"
    click_button "Login"
    
    page.should have_content "Invalid email or password."
    page.should have_button "Login"
  end
  
  it "takes a user to events index on success" do
    sign_up_as_hello_world
    click_link "Logout"
    
    visit "/users/sign_in"
    fill_in "Username or Email", with: "hello_world"
    fill_in "Password", with: "pass"
    click_button "Login"
    
    page.should have_content "Signed in successfully."
    page.should have_link "hello_world"
  end
end