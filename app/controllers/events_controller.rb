class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @event = Event.new
    @reccurring_events = []
    @events = []
    
    # Occurrence.all(:select => "*, event_time as coolness", :order => "coolness")
    
    Occurrence.order("event_time").each do |o|
      if o.event.reccurring == true && o.event_time.between?(DateTime.now, DateTime.now + 1.weeks)
        @reccurring_events << o
      elsif o.event.reccurring != true
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
    
    if d && t && d.future?
      time = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
      params[:event][:user_id] = current_user.id
      @event = Event.create(params[:event])
      
      if @event.reccurring
        52.times do |i|
          @event.occurrences.create({ :event_time => time + i.weeks })
        end
      else
        @event.occurrences.create({ :event_time => time })
      end
      
      # Fix this..
      
      respond_to do |format|
        format.html { redirect_to events_url }
        format.json { render :json => @event }
      end
    else
      flash[:alert] += "Study harder!!"
      redirect_to events_path
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
end