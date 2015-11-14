json.array!(@migrations) do |migration|
  json.extract! migration, :id, :addPaperclipToPictures
  json.url migration_url(migration, format: :json)
end
