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

      UNITS = /mi|km|m|hr/

      def measure(raw_stat)
        raw_stat.gsub(UNITS,'')
      end

      def unit(raw_stat)
        raw_stat[UNITS]
      end
    end

    get '/athletedata/:athlete_id' do
      begin
        strava_profile = Nestful.get(URI.join('http://www.strava.com/athletes/', params[:athlete_id]))

        doc = Nokogiri::HTML(strava_profile)
        stats = doc.css('div.athlete-stats strong').map{|s|s.text}

        formatted_stats = {cycling: {distance:      measure(stats[0]),
                                     distance_unit: unit(stats[0]),
                                     time:          measure(stats[1]),
                                     time_unit:     unit(stats[1]),
                                     rides:         stats[2]},
                           running: {distance:      measure(stats[3]),
                                     distance_unit: unit(stats[3]),
                                     time:          measure(stats[4]),
                                     time_unit:     unit(stats[4]),
                                     runs:         stats[5]}
                          }

        json(formatted_stats)
      rescue Nestful::ResourceNotFound => e
        halt(422, json({error: 'Incorrect Athlete ID.'}))
      end
    end
  end
end
