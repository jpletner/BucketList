json.array!(@adventures) do |adventure|
  json.extract! adventure, :id, :title, :description, :duedate, :creator, :priority, :completed
  json.url adventure_url(adventure, format: :json)
end
