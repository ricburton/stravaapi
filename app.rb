require 'rubygems'
require 'bundler'
require 'open-uri'
Bundler.require

module StravaAPI
  class App < Sinatra::Base
    get '/athletedata/:athlete_id' do
      content_type :json
      begin
        doc = Nokogiri::HTML(open("http://www.strava.com/athletes/#{params[:athlete_id]}"))
      rescue => e
        return 'Incorrect Athlete ID.'.to_json
      end

      stats = []
      unit_strings = ['mi','hr','km']
      doc.css('div.athlete-stats strong').each do |stat|
        raw_stat = stat.text
        unit_strings.each{|string| raw_stat.gsub!(string,'')}
        stats << raw_stat
      end

      formatted_stats = {total_distance_cycling: stats[0],
                         total_time_cycling:     stats[1],
                         total_rides:            stats[2],
                         total_distance_ran:     stats[3],
                         total_time_runnig:      stats[4],
                         total_runs:             stats[5]}

      return formatted_stats.to_json
    end
  end
end
