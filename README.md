## (Unofficial) Strava API
#### _A tiny Ruby API for an athlete's most basic statistics on Strava_

Like [many others](https://github.com/chocolit/dashboard), I'm interested in the idea of creating a personal dashboard. [Strava](http://www.strava.com/) is my app-of-choice for exercise tracking because of its community and in-built game mechanics. Right now, they're focussing on new product developments and have [decided to retire their API](http://engineering.strava.com/strava-v1v2-api-retired/). I'm really excited to see what they're going to release in the near future; in the meantime, I want to get access to some basic data about how far I have run and cycled. Every athlete has a public page with some basic statistics; you can see mine [here](http://www.strava.com/athletes/577065). This app simply scrapes the *Athlete Stats* and presents them in a JSON format.

This API receives a request to: http://stravaapi.herokuapp.com/athletedata/:athlete_id and then returns a response that looks like this:

    {
    "cycling":{
      "distance"      : "49.2",
      "distance_unit" : "mi",
      "time"          : "4",
      "time_unit"     : "hr",
      "rides"         : "9"
      },
    "running":{
      "distance"      : "199.7",
      "distance_unit" : "mi",
      "time"          : "26",
      "time_unit"     : "hr",
      "rides"         : "128"
      }
    }

You can see what my results look like [here](http://stravaapi.herokuapp.com/athletedata/577065).
