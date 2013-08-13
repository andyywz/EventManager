class OccurrencesController < ApplicationController
  # before_filter :authenticate_user!, except: [:index, :show]

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
    
  end
  
  def create
    
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
        render partial: "occurrence_info", locals: { occurrence: @occurrence }
      else
        redirect_to current_user
      end
    end
  end
  
  def destroy
    
  end
end


# <%= button_to "Save", occurrence_path(o.id), method: :put, class: "update-button edit", remote: true %>
# <%= button_to "Destroy", occurrence_path(o.id), method: :delete, confirm: "Are you sure?", remote: true, class: "destroy-button edit" %>