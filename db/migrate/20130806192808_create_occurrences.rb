class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.integer :event_id
      t.datetime :event_time

      t.timestamps
    end
  end
end
