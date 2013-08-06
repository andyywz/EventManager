class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string  :name
      t.integer :cover
      t.string  :place
      t.integer :age_limit
      t.string  :music
      t.boolean :recurring
      t.string  :floor
      t.text    :body
      
      t.timestamps
    end
  end
end
