u1 = User.new({
  username: "admin", 
  fname: "caleb", 
  lname: "mcgalen", 
  email: "ay1164@messiah.edu"
})

u1.password = "pass"
u1.save

u2 = User.new({
  username: "andy", 
  fname: "Andy", 
  lname: "Yong", 
  email: "andyywz@gmail.com"
})

u2.password = "pass"
u2.save

u1.events.create({
  :name => "George Gee with Swing FX",
  :cover => 8,
  :place => "Swing 46", 
  :age_limit => 21, 
  :recurring => true, 
  :body => ""
})

u2.events.create({
  :name => "Professor Cunningham and his Old School",
  :place => "Radegast Hall, Brooklyn", 
  :age_limit => 21, 
  :recurring => false, 
  :body => "radegasthall.com" 
})

u2.events.create({
  :name => "Grand Street Stompers",
  :place => "Radegast Hall, Brooklyn", 
  :age_limit => 21, 
  :recurring => false, 
  :body => "radegasthall.com" 
})

u2.events.create({
  :name => "Hudson River Park's Sunset on the Hudson", 
  :place => "Pier 45 in Greenwich Village", 
  :recurring => false, 
  :body => "Friday nights mean great local music on Pier 45!"
})

u2.events.create({
  :name => "Rockaway Dance Party", 
  :place => "Caracas Rockaway at 106th Street", 
  :recurring => false, 
  :body => "Getting there - $2.25 subway fare and approximately a one hour trip to Beach 106th St Rockaway plus a two minute walk. Alternatively Rockabus for a back to school bus experience. Go to rockabus.com A special dancers bus to be announced soon. NAUTICAL DRESS ENCOURAGED"
})

e1 = u1.events.first

time = [
  DateTime.new(2013, 8, 6, 20, 0, 0, '0'),
  DateTime.new(2013, 8, 7, 21, 0, 0, '0'),
  DateTime.new(2013, 8, 7, 21, 0, 0, '0') + 5.days,
  DateTime.new(2013, 8, 9, 18, 45, 0, '0'),
  DateTime.new(2013, 8, 10, 19, 30, 0, '0')
]

# times [8pm, 9pm, 7pm, 7pm]

52.times do |i|
  e1.occurrences.create({
    :event_time => time[0] + i.weeks
  })
end

u2.events.each_with_index do |event, i|
  event.occurrences.create({
    :event_time => time[i + 1]
  })
end

Occurrence.all.each do |o|
  u_id = u1.id
  Attending.create({
    :user_id => u_id,
    :occurrence_id => o.id
  })
  u_id = u_id == u1.id ? u2.id : u1.id
end