class EventPlayer < ActiveRecord::Base
  has_many :events, primary_key: :event_id, foreign_key: :id
  has_many :players, primary_key: :player_id, foreign_key: :id
  validates :player_id, uniqueness: {:scope => :event_id}
end
