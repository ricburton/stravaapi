require 'rubygems'
require 'bundler'
require 'uri'
Bundler.require

module StravaAPI
  class App < Sinatra::Base

    helpers do
      def json(value, options = {})
         content_type :json
         value.to_json(options)
       end
    end

    get '/athletedata/:athlete_id' do
      begin
        strava_profile = Nestful.get(URI.join('http://www.strava.com/athletes/', params[:athlete_id]))

        doc = Nokogiri::HTML(strava_profile)
        stats = []
        doc.css('div.athlete-stats strong').each do |stat|
          stats << stat.text.gsub!(/mi|hr|km/,'')
        end

        formatted_stats = {total_distance_cycling: stats[0],
                           total_time_cycling:     stats[1],
                           total_rides:            stats[2],
                           total_distance_running: stats[3],
                           total_time_running:     stats[4],
                           total_runs:             stats[5]}

        json(formatted_stats)
      rescue Nestful::ResourceNotFound => e
        halt(422, json({error: 'Incorrect Athlete ID.'}))
      end
    end
  end
end