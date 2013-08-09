class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string  :name
      t.integer :cover
      t.string  :place
      t.integer :age_limit
      t.boolean :recurring
      t.text    :body
      t.integer :user_id
      
      t.timestamps
    end
  end
end
