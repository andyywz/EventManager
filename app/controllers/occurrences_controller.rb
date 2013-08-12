class OccurrencesController < ApplicationController
  # before_filter :authenticate_user!, except: [:index, :show]
  
  def show
    @occurrence = Occurrence.find(params[:id])
    
    if request.xhr?
      render partial: "show", locals: { occurrence: @occurrence }
    else
      redirect_to event_url(params[:id])
    end
  end
end