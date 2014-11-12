json.array!(@feed_entries) do |feed_entry|
  json.extract! feed_entry, :id, :name, :url, :guid, :published_at, :summary, :content
  json.url feed_entry_url(feed_entry, format: :json)
end
