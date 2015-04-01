class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  validates :name, :surname, :phone, presence: true
  validates :phone, uniqueness: true
  validates :password, :confirmation => true
  
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
