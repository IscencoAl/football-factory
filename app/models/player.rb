class Player < ActiveRecord::Base
  validates :name, :surname, :phone, presence: true
  validates :phone, uniqueness: true
end
