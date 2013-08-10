ActiveAdmin.register Event do
  index do
    column :name
    column "Creator", :user, sortable: :user
    column "Venue", :place
    column :cover, sortable: :cover do |event|
      div class: "admin-cover" do
        event.cover ? "$ #{event.cover}" : "-"
      end
    end
    column :age_limit
    column :recurring
    column "Created Date", :created_at
    default_actions
  end
end
