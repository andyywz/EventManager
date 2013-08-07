class Occurrence < ActiveRecord::Base
  attr_accessible :event_id, :event_time
  
  belongs_to :event
  has_many :attendings
  has_many :attending_users, through: :attendings, source: :user
  
  before_save do
    self.event_time = round_time(self.event_time, 30.minutes)
  end
  
  def round_time(event_time, seconds = 60)
    date = event_time.to_date
    time = Time.at((event_time.to_time.to_f / seconds).round * seconds)
    create_datetime(date, time)
  end
  
  def create_datetime(date, time)
    d = date
    t = time
    dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
  end
end
