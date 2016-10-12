get "/" do
  binding.pry
  # @local_weather_json = get_all_weather
  # @temp = get_temp(@local_weather)
  # @wind = get_wind(@local_weather)
  # @location = get_location(@local_weather_json)
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
  @elevate_change = elevation(params[:feet].to_i, params[:elevation], @yardage_orig)
  @wind_change = wind(@wind, @yardage_orig, params[:direction])
  @slope_change = slope(params[:slope])
  @rough_change = rough(params[:rough])
  @rain_change = rain(params[:rain])
  @bunker_change = bunker(params[:bunker])
  @yardage_adj = @yardage_orig + @temp_change + @elevate_change + @wind_change + @slope_change + @rough_change + @rain_change + @bunker_change

  erb :"show"
end

# get "/show" do
#   erb :'/show'
# end
