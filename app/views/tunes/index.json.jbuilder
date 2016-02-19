json.array!(@tunes) do |tune|
  json.extract! tune, :id, :name, :artist, :genre
  json.url tune_url(tune, format: :json)
end
