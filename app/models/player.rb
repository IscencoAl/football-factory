class Player < ActiveRecord::Base
  validates :name, :surname, :phone, presence: true
  validates :phone, uniqueness: true

  def full_name
    unless self.nickname.blank?
      player_name = "#{self.name} '#{self.nickname}' #{self.surname}"
    else
      player_name = "#{self.name} #{self.surname}"
    end
    return player_name
  end
end
