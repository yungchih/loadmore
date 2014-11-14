json.array!(@feeds) do |feed|
  json.extract! feed, :id, :name, :url, :guid, :published_at, :summary, :content
  json.url feed_url(feed, format: :json)
end
