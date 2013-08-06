class Occurrence < ActiveRecord::Base
  attr_accessible :event_id, :event_time
  
  belongs_to :event
  has_many :attendings
  has_many :attending_users, through: :attendings, source: :user
end
