# ShotAdjuster

## What It Is
ShotAdjuster is a Ruby web application to assist you with your golf game.  Questions are asked about your golf shot (e.g. Are you in the rough? What direction is the wind blowing? Are you above or below the hole?).  Once entered, ShotAdjuster calcluates changes to your distance and displays what yardage you should account for.  A list of the adjustments is provided to you as well on the results page.  This is meant to help the novice player who has trouble deciding which club to use in certain situations. 

Try it out here: [ShotAdjuster Mobile](https://shotadjustermobile.herokuapp.com/) .  The app is meant to be run on your mobile phone's web browser.

## How To Use
At the start of your round, you will need to enter the city and state in which you are playing.  The location is then stored throughout your round to be used for the Weather Underground API (link below).  The API provides the current temperature and wind speed for making the necessary adjustments.  

Enter your distance from target from a GPS applciation, rangefinder, course yard markers, etc.  

Update the fields that pertain to your shot situation.  Defaulted entries will not effect the yardage adjustment.  

Hit "Tell Me My Yardage!" and get your results!

## Screen Shots

![Entry and results pages] (https://github.com/lukin41280/ShotAdjuster/blob/master/Screen%20Shot%202016-10-13%20at%202.59.30%20PM.png)     

## Technologies Used
- Ruby 2.0.0p648
- Sinatra
- ActiveRecord ~>4.2.0
- PostgreSQL
- Weather Underground API - https://www.wunderground.com/weather/api/
- Heroku

## Connect
Please let me know how the app works for you and if you encounter any issues.  
