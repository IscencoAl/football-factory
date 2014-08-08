class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :surname
      t.string :nickname
      t.string :phone
      t.string :skype
      t.string :email

      t.timestamps
    end
  end
end
