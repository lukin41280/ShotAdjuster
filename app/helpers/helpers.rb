
def get_all_weather
  weather_api = "http://api.wunderground.com/api/28b90ef0eef8b2c8/conditions/q/autoip.json"
  uri = URI(weather_api)
  net = Net::HTTP.get_response(uri)
  json = JSON.parse(net.body)
end

def get_temp(all_weather)
  all_weather["current_observation"]["temp_f"]
end

def get_wind(all_weather)
  all_weather["current_observation"]["wind_mph"]
end

def get_location(all_weather)
  all_weather["current_observation"]["display_location"]["full"]
end

def temperature(degrees)
  if degrees < 70.0
    temp_change = ((70.0 - degrees) * 0.35)
  else
    temp_change = 0
  end
  temp_change
end

# Elevation method - for every 1ft above/below target: (+/-) .5yds >150 yards out,
# (+/-) .25yds 150-130 yards out, (+/-) .1yds <130 yards out
def elevation(feet, elevation, yardage)
  
  if elevation == "default"
    feet = 0.01
  end
  #this changes yard adjustment to negative impact
  if elevation == "above"
    feet = feet * -1
  end
  if yardage > 150.0
    elevate_change = feet * 0.5
  elsif yardage <= 150.0 && yardage >= 130.0
    elevate_change = feet * 0.25
  elsif yardage < 130.0
    elevate_change = feet * 0.13
  end
  elevate_change
end

# Wind method - for every 1mph in the face: add 1yd >200 yards out,
# add .75yrds 200-100 yards out, .5yds <100 yards out
# subtract yardage for wind in the back
# for diagonal wind in the face: add amounts above, but take half the values
# subtract half the values for wind diagonally in the back
def wind(mph, yardage, direction)
  if direction == "default"
    wind_change = 0
  end
  if direction == "inface"
    if yardage > 200.0
      wind_change = mph
    elsif yardage <= 200.0 && yardage >= 100.0
      wind_change = mph * 0.75
    elsif yardage < 100.00
      wind_change = mph * 0.50
    end
  end
  if direction == "behind"
    if yardage > 200.0
      wind_change = -(mph)
    elsif yardage <= 200.0 && yardage >= 100.0
      wind_change = -(mph) * 0.75
    elsif yardage < 100.00
      wind_change = -(mph) * 0.50
    end
  end
  if direction == "partfront"
    if yardage > 200.0
      wind_change = (mph)/2
    elsif yardage <= 200.0 && yardage >= 100.0
      wind_change = ((mph) * 0.75)/2
    elsif yardage < 100.00
      wind_change = ((mph) * 0.50)/2
    end
  end
  if direction == "partbehind"
    if yardage > 200.0
      wind_change = -(mph)/2
    elsif yardage <= 200.0 && yardage >= 100.0
      wind_change = -((mph) * 0.75)/2
    elsif yardage < 100.00
      wind_change = -((mph) * 0.50)/2
    end
  end
  wind_change
end

# Slope method - if hitting uphill add 10yds, if hitting downhill minus 10yds
def slope(hill_type)
  if hill_type == "uphill"
    slope_change = 10.0
  elsif hill_type == "downhill"
    slope_change = -10.0
  else
    slope_change = 0
  end
  slope_change
end


# Rough method - for sitting up: add 5% to total yds, for 25% buried: add 10% to total yds, for half ball: add 20% to total
def rough(depth)
  if depth == "up"
    rough_change = 0.05
  elsif depth == "part"
    rough_change = 0.10
  elsif depth == "buried"
    rough_change = 0.20
  else
    rough_change = 0
  end
  rough_change
end

# Rain method - if yes, add 10yds
def rain(is_raining)
  if is_raining == "yes"
    rain_change = 10
  else
    rain_change = 0
  end
  rain_change
end

# Fairway bunker method - if yes, add 10yds
def bunker(in_sand)
  if in_sand == "yes"
    bunker_change = 10
  else
    bunker_change = 0
  end
  bunker_change
end

def club_distance_builder(club, entered_distance)
  # entered distance will add 5 and subtract 4 to give range
  max_dist = entered_distance + 5
  min_dist = entered_distance - 4
  # then will cycle through and grab the 10 distances to add to the club
  index = min_dist
  until index > max_dist
    club.distances << Distance.find_by(yards: index)
    index += 1
  end
end

def club_displayer(yardage)
  string_yd = yardage.to_s
  golfer = Golfer.find_by(name: "Jay")
  dist = golfer.distances.find_by(yards: string_yd)
  if dist
    club = golfer.clubs.find(dist.club_id)
    club.name
  else
    return "none"
  end
end


