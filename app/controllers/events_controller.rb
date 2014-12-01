class EventsController < ApplicationController
  def index
  	@upcoming_events = Rails.cache.fetch("all_upcoming_events", :expires_in => 10.minutes){
  		events_json = RestClient.get "http://renevents.browsermedia.com/api/events/upcoming.json"
  		upcoming_events_parsed = JSON.parse events_json
  		upcoming_events_parsed
  	}
  	respond_to do |format|
  		format.html
  		format.js
  	end

  end


  def cached_events
    params[:id]? @id = params[:id] : @id = 7

  	@upcoming_events = Rails.cache.fetch("all_upcoming_events", :expires_in => 10.minutes){
  		events_json = RestClient.get "http://renevents.browsermedia.com/api/events/upcoming.json"
  		upcoming_events_parsed = JSON.parse events_json
  		upcoming_events_parsed
  	}
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end
end
