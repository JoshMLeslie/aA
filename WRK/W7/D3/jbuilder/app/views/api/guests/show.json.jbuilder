json.partial! 'api/guests/guest', guest: @guest

json.gifts do
  
  json.partial! 'api/gifts/gift', gift: @guest.id
end
