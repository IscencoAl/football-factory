class CreateEventPlayers < ActiveRecord::Migration
  def change
    create_table :event_players do |t|
      t.integer :event_id
      t.integer :player_id

      t.timestamps
    end
  end
end
