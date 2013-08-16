# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
end

def sign_up(fname, lname, username)
  visit "/users/sign_up"
  fill_in "First Name", with: fname
  fill_in "Last Name", with: lname
  fill_in "New Username", with: username
  fill_in "Email", with: "#{username}@example.com"
  fill_in "Password", with: "pass"
  fill_in "Password confirmation", with: "pass"
  click_button "Sign Up"
end

def sign_up_as_hello_world
  sign_up("hello","world","hello_world")
end

def login(username)
  visit "users/sign_in"
  fill_in "Username or Email", with: username
  fill_in "Password", with: "pass"
  click_button "Login"
end

def make_event_hash(name, recursive)
  event = {
    recursive: recursive,
    name: name,
    place: "#{name}'s cool venue.",
    date: "1991-03-03",
    time: "22:00",
    cover: 1000,
    age_limit: 21,
    body: "Jonathan approves!"
  }
end

def make_weekly_event(name = nil)
  name ||= "Weekly Event"
  event = make_event_hash(name, true)
  
  visit "/events/new"
  click_on "new-event-button"
  make_event(event)
end

def make_weekly_event_from_index(name = nil)
  name ||= "Weekly Event"
  event = make_event_hash(name, true)
  
  visit "/"
  click_on "new-event-button"
  make_event(event)
end

def make_special_event(name = nil)
  name ||= "Special Event"
  event = make_event_hash(name, false)
  
  visit "/events/new"
  make_event(event)
end

def make_special_event_from_index(name = nil)
  name ||= "Special Event"
  event = make_event_hash(name, false)
  
  visit "/"
  click_on "new-event-button"
  make_event(event)
end

def make_event(event)
  choose "event_recurring_#{event[:recursive]}"
  fill_in "event_name", with: event[:name]
  fill_in "event_place", with: event[:place]
  fill_in "occurrence_date", with: event[:date]
  fill_in "occurrence_time", with: event[:time]
  fill_in "event_cover", with: event[:cover]
  fill_in "event_age_limit", with: event[:age_limit]
  fill_in "event_body", with: event[:body]
  click_button "Create Event"
end