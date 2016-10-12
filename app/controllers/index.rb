get "/" do
  erb :"index"
end

post "/result" do
  @yardage_orig = params[:distance].to_i
  @city = params[:city]
  session[:city] = @city
  @state = params[:state]
  session[:state] = @state
  @weather = get_all_weather(@city, @state)
  @temp = get_temp(@weather)
  @wind = get_wind(@weather)
  @temp_change = temperature(@temp)
  @elevation = params[:elevation]
  @feet = params[:feet].to_i
  @elevate_change = elevation(@feet, @elevation, @yardage_orig)
  @direction = params[:direction]
  @wind_change = wind(@wind, @yardage_orig, @direction)
  @slope = params[:slope]
  @slope_change = slope(@slope)
  @rough = params[:rough]
  @rough_change = rough(@yardage_orig, @rough)
  @rain = params[:rain]
  @rain_change = rain(@rain)
  @bunker = params[:bunker]
  @bunker_change = bunker(@bunker)
  @yardage_adj = @yardage_orig + @temp_change + @elevate_change + @wind_change + @slope_change + @rough_change+ @rain_change + @bunker_change

  erb :"show"
end

