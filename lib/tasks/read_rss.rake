namespace :read_rss do
  require 'rss'

  desc "read rss feed and parse it"
  # rake read_rss:getrss
  task getrss: :environment do
  	# rss = RSS::Parser.parse('http://www.michaelrigart.be/en/blog.rss', false)
  	# rss = RSS::Parser.parse('http://journalsblog.gastro.org/feed/',false)
		# rss.items.each do |item|
			# puts "#{item.inspect}"
  		# puts "#{item.pubDate} - #{item.title}"	
		# end

					# urls = %w[http://feedjira.com/blog/feed.xml]
					# feeds = Feedjira::Feed.fetch_and_parse urls
					# feed = feeds['http://feedjira.com/blog/feed.xml']
					
					# feed.entries.each do |entry|
					# 	puts "ID: #{entry.id}\n"
					# 	puts "LINKS: #{entry.links}\n"
					# 	puts "TITLe: #{entry.title}\n"
					# 	puts "AUTHOR: #{entry.author}\n"
					# 	puts "PUBLISHED: #{entry.published}\n"
					# 	puts "CONTENT: #{entry.content}\n"
					# 	puts "="*100
					# end
		
# READ RSS AND PARSE IT
				url = %w[http://journalsblog.gastro.org/feed/]		
				feeds = Feedjira::Feed.fetch_and_parse url
				feed = feeds['http://journalsblog.gastro.org/feed/']
				feed.entries.each do |entry|
					exists = FeedEntry.where(guid: entry.id).first
					puts "#{exists.nil?}\n"
					if exists.nil?
						FeedEntry.create!(
							name: entry.title,
							summary: entry.summary,
							url: entry.url,
							published_at: entry.published,
							guid: entry.id,
							content: entry.content
						)
					end
					# puts "ID: #{entry.id}\n"
					# puts "TITLE:#{entry.title}\n"
					# puts "URL: #{entry.url}\n"
					# puts "Date: #{entry.published}\n"
					# puts "AUTHOR:#{entry.author}\n"
					# puts "CATEGORIES:#{entry.categories}\n"
					# puts "SUMMARY:#{entry.summary}\n"
					# puts "Content:\n#{entry.content}\n"
					# puts "="*100

				end
			



		# open("http://journalsblog.gastro.org/feed/")	do |response|
		# 	ping_successful = response.status[0] == "200" ? true : false
		# 	if ping_successful
		# 		content = response.read
		# 		rss = RSS::Parser.parse(content, false)
		# 		# puts rss.items.first.inspect
		# 		rss.items.each_with_index do |item,i|
		# 			puts "#{i+1}:"
		# 			puts "#{item.link}\n"
		# 			puts "#{item.title}\n"
		# 			puts "#{item.description}\n"
		# 			puts "#{item.pubDate}\n"
		# 			puts "#{item.guid}\n"
		# 			puts "#{item.category}\n"
		# 			puts "="*100
		# 		end
		# 	end
		# end

  end

end
