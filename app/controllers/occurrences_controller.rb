class OccurrencesController < ApplicationController
  # before_filter :authenticate_user!, except: [:index, :show]

  def show
    @occurrence = Occurrence.find(params[:id])
    
    if request.xhr?
      render partial: "show", locals: { occurrence: @occurrence }
    else
      redirect_to events_url
    end
  end
end


# <%= button_to "Save", occurrence_path(o.id), method: :put, class: "update-button edit", remote: true %>
# <%= button_to "Destroy", occurrence_path(o.id), method: :delete, confirm: "Are you sure?", remote: true, class: "destroy-button edit" %>