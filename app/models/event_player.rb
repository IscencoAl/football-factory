class EventPlayer < ActiveRecord::Base
  validates :player_id, uniqueness: {:scope => :event_id}
  
  has_many :events, primary_key: :event_id, foreign_key: :id
  has_many :players, primary_key: :player_id, foreign_key: :id
end
