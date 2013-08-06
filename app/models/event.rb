class Event < ActiveRecord::Base
  attr_accessible :name, :cover, :place, :age_limit, :music, :recurring, :floor, :body, :user_id
  
  has_many :occurrences
  belongs_to :user
end
