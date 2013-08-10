ActiveAdmin.register Occurrence do
  index do
    column :event
    column :event_time
    column "Event Info" do |occurrence|
      occurrence.event.body
    end
  end
end
