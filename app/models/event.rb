class Event < ActiveRecord::Base
  attr_accessible :name, :cover, :place, :age_limit, :recurring, :body, :user_id
  
  has_many :occurrences
  belongs_to :user
end
