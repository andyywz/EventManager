class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @reccurring_events = []
    @events = []
    
    Occurrence.all.each do |o|
      if o.event.reccurring == true && o.event_time.between?(DateTime.now, DateTime.now + 1.week)
        @reccurring_events << o
      elsif o.event.reccurring != true
        @events << o
      end
    end
    
  end
  
  def show
    
  end
  
  def new
    
  end
  
  def create
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
end
