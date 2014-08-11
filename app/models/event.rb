class Event < ActiveRecord::Base
  validates :name, :start_time, :end_time, :price, presence: true
  validates :start_time,  uniqueness: true
  has_many :event_players
  has_many :players, through: :event_players

end
