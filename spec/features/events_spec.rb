require "spec_helper"

feature "Creating an event" do
  context "when logged in" do
    before :each do
      sign_up_as_hello_world
      visit "/events/new"
    end
    
    it "has a new events page" do
      page.should have_button "Create Event"
    end
    
    it "takes type, name, venue, start date, time, cover, age, and etc" do
      page.should have_content "Weekly Event"
      page.should have_content "Special Event"
      page.should have_content "Event Name"
      page.should have_content "Venue"
      page.should have_content "Start Date"
      page.should have_content "Time"
      page.should have_content "Cover/Fee"
      page.should have_content "Age Limit"
      page.should have_content "ETC"
    end
    
    it "validates the presence of name, venue" do
      fill_in "event_cover", with: 100
      fill_in "event_body", with: "this should fail"
      
      click_button "Create Event"
      page.should have_content "Failed"
    end
  end
end