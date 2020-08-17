json.array! @haikus do |haiku|
  json.id haiku.id
  json.name haiku.user.name
  json.ward pick_out_ward(haiku.address)
  json.city pick_out_city(haiku.address)
  json.prefecture pick_out_prefecture(haiku.address)
end
