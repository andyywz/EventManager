class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @event = Event.new
    @reccurring_events = []
    @events = []
    
    Occurrence.all.each do |o|
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
    params[:event][:user_id] = current_user.id
    @event = Event.create(params[:event])
    
    d = params[:occurrence][:date]
    t = params[:occurrence][:time]
    time = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
    
    if @event.reccurring
      52.times do |i|
        @event.occurrences.create({ :event_time => time + i.weeks })
      end
    else
      @event.occurrences.create({ :event_time => time })
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
end