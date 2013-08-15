class UsersController < ApplicationController
  before_filter :user_signed_in?, except: :show
  
  def index
    @users = User.all
    @occurrences = Occurrence.where("event_time >= ? AND event_time <= ?", Date.today, Date.today + 30.days).order("event_time")
  end
  
  def show
    @user = User.find(params[:id])
    
    # Test these queries
    @attending_events = @user.attending_events.where("event_time >= ?", Date.today).order("event_time")
  end
  
end
