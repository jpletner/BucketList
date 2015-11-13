json.array!(@adventure_photos) do |adventure_photo|
  json.extract! adventure_photo, :id, :adventure_id
  json.url adventure_photo_url(adventure_photo, format: :json)
end
