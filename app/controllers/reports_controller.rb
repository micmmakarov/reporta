class ReportsController < ApplicationController
  def index
    user = current_user
    #events = HTTParty.get("https://api.github.com/users/#{user.nickname}/events?access_token=#{user.token}", headers: {"User-Agent" => "MEOW", "Accept" => "application/vnd.github.v3+json"})
    events = []
    if events.any?
    	user.cached_events = events.to_json
    	user.save!
    end
    @events = user.cached_events
  end
end
