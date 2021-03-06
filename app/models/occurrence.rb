class Occurrence < ActiveRecord::Base
  attr_accessible :event_id, :event_time
  
  belongs_to :event
  has_many :attendings, dependent: :destroy
  has_many :attending_users, through: :attendings, source: :user
  validate :in_the_future
  
  # before_save do
  #   self.event_time = round_time(self.event_time, 30.minutes)
  # end
  
  def in_the_future
    if self.event_time < DateTime.now.utc.to_date
      errors[:base] << "Not in the future! We don't care about past events!"      
    end
  end
  
  def round_time(event_time, seconds = 60)
    date = event_time.to_date
    time = Time.at((event_time.to_time.to_f / seconds).round * seconds).utc
    create_datetime(date, time)
  end
  
  def create_datetime(date, time)
    d = date
    t = time
    dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
  end
end
