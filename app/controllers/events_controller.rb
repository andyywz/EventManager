class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @event = Event.new
    @recurring_events = []
    @events = []
    
    Occurrence.order("event_time").each do |o|
      if o.event.recurring == true && o.event_time.between?(Date.today, Date.today + 1.weeks)
        @recurring_events << o
      elsif o.event.recurring != true && o.event_time >= Date.today
        @events << o
      end
    end
  end
  
  def show
  end
  
  def create
    # need to check to see if time is in the future
    
    d = DateTime.parse(params[:occurrence][:date])
    t = DateTime.parse(params[:occurrence][:time])
    
    if d && t && d >= DateTime.now.utc.to_date
      time = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
      params[:event][:user_id] = current_user.id
      @event = Event.create(params[:event])
      p time
      if @event.recurring
        52.times do |i|
          @event.occurrences.create({ :event_time => time + i.weeks })
        end
      else
        @event.occurrences.create({ :event_time => time })
      end
    end
    
    respond_to do |format|
      format.html do
        redirect_to events_path
      end
      
      format.json do
        if d >= DateTime.now.utc.to_date
          render :json => @event
        else
          flash.now[:alert] = "Study harder!!"
          render :json => false
        end
      end
      
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
end