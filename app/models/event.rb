class Event < ActiveRecord::Base
  attr_accessible :name, :cover, :place, :age_limit, :recurring, :body, :user_id
  
  has_many :occurrences, dependent: :destroy
  belongs_to :user
  
  validates :name, :place, presence: true    
  # test this
  
  def future_occurrences
    self.occurrences.where("event_time >= ?", Date.today).order("event_time")
  end
  
  def create_occurrences(time)
    if self.recurring
      52.times do |i|
        self.occurrences.create({ :event_time => time + i.weeks })
      end
    else
      self.occurrences.create({ :event_time => time })
    end
  end
end