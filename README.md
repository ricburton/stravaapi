## (Unofficial) Strava API
#### _A tiny Ruby API for an athlete's most basic statistics on Strava_

Like [many others](https://github.com/chocolit/dashboard), I'm interested in the idea of creating a personal dashboard. [Strava](http://www.strava.com/) is my app-of-choice for exercise tracking because of its community and in-built game mechanics. Right now, they're focussing on new product developments and have (decided to retire their API)[http://engineering.strava.com/strava-v1v2-api-retired/]. I'm really excited to see what they're going to release in the near future; in the meantime, I want to get access to some basic data about how far I have run and cycled. Every athlete has a public page at: http://www.strava.com/atheletes/[your athlete ID]. You can see mine (here)[http://www.strava.com/athletes/577065]. This app simply scrapes the *Athlete Stats* and presents them in a JSON format.

This API receives a request to: http://stravaapi.herokuapp.com/athletedata/:athlete_id and then returns a response that looks like this:

    {"total_distance_cycling" : "49.2",
    "total_time_cycling"      : "4",
    "total_rides"             : "9",
    "total_distance_running"  : "195.1",
    "total_time_running"      : "25",
    "total_runs"              : "125"}

## TODO
    - Add miles/km to the response.
