json.array! @haikus do |haiku|
  json.id haiku.id
  json.name haiku.user.name
  json.ward pick_out_ward(haiku.address)
  json.city pick_out_city(haiku.address)
  json.prefecture pick_out_prefecture(haiku.address)
  json.user_id haiku.user_id
  json.created_at time_ago_in_words(haiku.created_at)
  if haiku.favorites.present?
    haiku.favorites.each do |favorite|
      if favorite.user_id == current_user.id
        json.favorites haiku.favorites
      end
    end
  end
end
