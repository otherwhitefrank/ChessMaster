json.array!(@player_profiles) do |player_profile|
  json.extract! player_profile, :id
  json.url player_profile_url(player_profile, format: :json)
end
