class Player < ActiveRecord::Base
  validates :name, :surname, :phone, presence: true
  validates :phone, uniqueness: true
  
  has_many :event_players, :dependent => :delete_all
  has_many :events, through: :event_players

  attr
  def full_name
    unless self.nickname.blank?
      player_name = "#{self.name} \"#{self.nickname}\" #{self.surname}"
    else
      player_name = "#{self.name} #{self.surname}"
    end
    
    return player_name
  end
end
