json.array!(@players) do |player|
  json.extract! player, :id, :name, :surname, :nickname, :phone, :skype, :email
  json.url player_url(player, format: :json)
end
