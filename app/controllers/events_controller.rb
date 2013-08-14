class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @event = Event.new
    @recurring_events, @events = sort_events[0], sort_events[1]
  end
  
  def show
    @event = Event.find(params[:id])
    
    if request.xhr?
      render partial: "show", locals: { event: @event }
    else
      redirect_to events_path
    end
  end
  
  def new
    @event = Event.new
  end
  
  def create
    # need to check to see if time is in the future
    d = DateTime.parse(params[:occurrence][:date])
    t = DateTime.parse(params[:occurrence][:time])
    
    if d && t && d >= DateTime.now.utc.to_date
      time = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
      params[:event][:user_id] = current_user.id
      @event = Event.create(params[:event])

      if @event.recurring
        52.times do |i|
          @event.occurrences.create({ :event_time => time + i.weeks })
        end
      else
        @event.occurrences.create({ :event_time => time })
      end
    end
    
    if request.xhr?
      recurring_events, events = sort_events[0], sort_events[1]
      render partial: "events", locals: {recurring: recurring_events, special: events}
    else
      redirect_to events_url
    end
  end
  
  def edit
    @event = Event.find(params[:id])
    @occurrences = Kaminari.paginate_array(@event.future_occurrences).page(params[:page])
  end
  
  def update
    @event = Event.find(params[:id])
    @occurrences = Kaminari.paginate_array(@event.future_occurrences).page(params[:page])
    
    if @event.update_attributes(params[:event])
      flash[:notice] = "Update Successful!"
      redirect_to current_user
    else
      flash[:alert] = "Update Failed"
      render :edit
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    
    if @event.destroy
        flash[:notice] = "Destroy successful!"
        redirect_to current_user
    else
      flash[:alert] = "Failed to destroy"
      redirect_to current_user
    end
  end

  
  private
  
  def sort_events
    recurring_events = [];
    events = [];
    Occurrence.order("event_time").each do |o|
      if o.event.recurring == true && o.event_time.between?(Date.today, Date.today + 1.weeks)
        recurring_events << o
      elsif o.event.recurring != true && o.event_time >= Date.today
        events << o
      end
    end
    
    [recurring_events, events]
  end
end