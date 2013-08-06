class Attending < ActiveRecord::Base
  attr_accessible :occurrence_id, :user_id
  
  belongs_to :user
  belongs_to :occurrence 
end
