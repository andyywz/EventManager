class UsersController < ApplicationController
  before_filter :user_signed_in?, except: :show
  
  def index
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end
