class EventsController < ApplicationController
  def index
  	@upcoming_events = Rails.cache.fetch("all_upcoming_events", :expires_in => 3.minutes){
  		events_json = RestClient.get "http://renevents.browsermedia.com/api/events/upcoming.json"
  		upcoming_events_parsed = JSON.parse events_json
  		upcoming_events_parsed
  	}

  end
end
