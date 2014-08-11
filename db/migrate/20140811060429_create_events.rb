class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :name
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :price

      t.timestamps
    end
  end
end
