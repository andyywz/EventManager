class Event < ActiveRecord::Base
  attr_accessible :name, :cover, :place, :age_limit, :recurring, :body, :user_id
  
  has_many :occurrences, dependent: :destroy
  belongs_to :user
  
  # test this
  
  def future_occurrences
    self.occurrences.where("event_time >= ?", Date.today)
  end
end