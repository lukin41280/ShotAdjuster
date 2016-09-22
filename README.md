# ShotAdjuster

## What It Is
ShotAdjuster is a Ruby application to assist you with your golf game.  Questions are asked about your golf shot (e.g. Are you in the rough? What direction is the wind blowing? Are you above or below the hole?).  Once entered, ShotAdjuster calcluates changes to your distance and recommends a club to swing.  This is meant to help the novice player who has trouble deciding which club to use in certain situations. 

## Screen Shots

![Entry and results pages] (https://github.com/lukin41280/ShotAdjuster/blob/master/Screen%20Shot%202016-09-22%20at%2011.06.54%20AM.png)

## How It Works
Currently the application needs to be run on a localhost using the Sinatra platform.  The user and golf club data is hard coded into the database to be run as a demo.  I used the Underground Weather API to obtain the local temperature and wind speed to be used for shot calculations.  Each question entry field has a yardage adjustment calculation built in behind it.  The calculations are taken from articles and blog posts on general rules on how to adjust your shot.  Once all calculations are in, the application returns an adjusted yardage to the user and matches a club for that yardage.      

## Technologies Used
- Ruby 2.0.0p648
- Sinatra
- ActiveRecord ~>4.2.0
- PostgreSQL
- Weather Underground API - https://www.wunderground.com/weather/api/

## Installation

### In terminal:
##### Clone the repo:

    git clone https://github.com/lukin41280/ShotAdjuster.git
    
##### Set up environment:

    bundle install
    bundle exec rake db:create
    bundle exec rake db:migrate
    bundle exec rake db:seed
    
##### Run the localhost server:

    shotgun
    
### In your browser:
Copy and paste into the URL:
    
    http://localhost:9393/
    
Now you will be ready to test out the app.

## Works In Progress
- Refactor code to seperate concerns
- Add register and login feature 
- Deploy application to online server
- Add geolocation feature so user does not have to enter city and state
- Stretch: Convert to a mobile app 
