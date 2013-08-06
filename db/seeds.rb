u1 = User.new({
  username: "admin", 
  fname: "caleb", 
  lname: "mcgalen", 
  kind: "admin", 
  email: "ay1164@messiah.edu"
})

u1.password = "pass"
u1.save

u2 = User.new({
  username: "andy", 
  fname: "Andy", 
  lname: "Yong", 
  kind: "admin", 
  email: "andyywz@gmail.com"
})

u2.password = "pass"
u2.save

u1.events.create({
  :name => "Grand Street Stompers",
  :cover => 10,
  :place => "Radegast", 
  :age_limit => 21, 
  :music => "Band", 
  :reccurring => true, 
  :floor => "Hardwood", 
  :body => "" 
})

u2.events.create({
  :name => "George Gee with Swing FX",
  :cover => 8,
  :place => "Swing 46", 
  :age_limit => 21, 
  :music => "Band",  
  :floor => "Hardwood", 
  :body => ""
})

e1 = u1.events.first
e2 = u2.events.first

time = DateTime.now

4.times do |i|
  e1.occurrences.create({
    :event_time => time + i.weeks
  })
end

e2.occurrences.create({
  :event_time => time + 2.months
})

Occurrence.all.each do |o|
  u_id = u1.id
  Attending.create({
    :user_id => u_id,
    :occurrence_id => o.id
  })
  u_id = u_id == u1.id ? u2.id : u1.id
end