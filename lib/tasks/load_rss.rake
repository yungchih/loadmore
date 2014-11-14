namespace :load_rss do
  
  desc "read rss feed and parse it"
  # rake load_rss:import_rss
  task import_rss: :environment do

# READ RSS AND PARSE IT
				url = %w[http://journalsblog.gastro.org/feed/]		
				feeds = Feedjira::Feed.fetch_and_parse url
				feed = feeds['http://journalsblog.gastro.org/feed/']
				feed.entries.each do |entry|
					exists = Feed.where(guid: entry.id).first
					puts "#{exists.nil?}\n"
					if exists.nil?
						@new_feed = Feed.create!(
							name: entry.title,
							summary: entry.summary,
							url: entry.url,
							published_at: entry.published,
							guid: entry.id,
							content: entry.content
						)

						@tags = add_tags(entry.categories)						
						@tags.each do |tag|
							@new_feed.tags << tag
						end

					end
				end

  end

end

def add_tags(categories)
	categories.collect do |cate|
		Tag.find_or_create_by(name: cate)
	end
end