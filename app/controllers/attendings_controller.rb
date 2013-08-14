class AttendingsController < ApplicationController
  def index
    
  end
  
  def create
    @attending = Attending.create({
      user_id: current_user.id,
      occurrence_id: params[:occurrence_id]
    })
    
    if request.xhr?
      render text: "nothing: true"
    else
      redirect_to current_user
    end
  end
  
  def destroy
    @attending = Attending.find_by_user_id_and_occurrence_id(current_user.id, params[:occurrence_id])
    @attending.destroy
    
    if request.xhr?
      render text: "nothing: true"
    else
      redirect_to current_user
    end
  end
end