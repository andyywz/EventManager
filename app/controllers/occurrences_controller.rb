class OccurrencesController < ApplicationController
  before_filter :authenticate_user!

  def index

  end

  def show
    @occurrence = Occurrence.find(params[:id])
    
    if request.xhr?
      render partial: "show", locals: { occurrence: @occurrence }
    else
      redirect_to events_url
    end
  end
  
  def new
    @event = Event.find(params[:event_id])
    if request.xhr?
      render partial: "new", locals: {event: @event}
    else
      render :new
    end
  end
  
  def create
    @event = Event.find(params[:event][:id])    
    d = DateTime.parse(params[:occurrence][:date])
    t = DateTime.parse(params[:occurrence][:time])
    time = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
    
    @occurrence = Occurrence.new({
      event_id: params[:event][:id],
      event_time: time
    })
    
    if @occurrence.save
      @occurrences = Kaminari.paginate_array(@event.future_occurrences).page(params[:page])
      if request.xhr?
        render partial: "create", locals: { occurrences: @occurrences } 
      else
        flash[:notice] = "Save successful!"
        redirect_to current_user
      end
    else
      if request.xhr?
        render partial: "fail"
      else
        flash[:alert] = "Failed to save. Make sure your new date/time is not in the past."
        redirect_to current_user
      end
    end
  end
  
  def edit
    @occurrence = Occurrence.find(params[:id])
  end
  
  def update
    @occurrence = Occurrence.find(params[:id])
    d = DateTime.parse(params[:occurrence][:date])
    t = DateTime.parse(params[:occurrence][:time])
    time = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
    
    if @occurrence.update_attributes({ event_time: time })
      if request.xhr?
        render partial: "update", locals: { occurrence: @occurrence } 
      else
        flash[:notice] = "Save successful!"
        redirect_to current_user
      end
    else
      if request.xhr?
        render partial: "fail"
      else
        flash[:alert] = "Failed to save. Make sure your new date/time is not in the past."
        redirect_to current_user
      end
    end
  end
  
  def destroy
    @occurrence = Occurrence.find(params[:id])
    
    if @occurrence.destroy
      if request.xhr?
        # delete DOM using js!!
        render partial: "destroy", locals: { occurrence: @occurrence }
      else
        flash[:notice] = "Destroy successful!"
        redirect_to current_user
      end
    else
      if request.xhr?
        render nothing: true
      else
        flash[:alert] = "Failed to destroy"
        redirect_to current_user
      end
    end
  end
end


# <%= button_to "Save", occurrence_path(o.id), method: :put, class: "update-button edit", remote: true %>
# <%= button_to "Destroy", occurrence_path(o.id), method: :delete, confirm: "Are you sure?", remote: true, class: "destroy-button edit" %>