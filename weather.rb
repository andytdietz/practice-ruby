require "http"

response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?lat=39.7392&lon=-104.9903&appid=#{ENV["OPEN_WEATHER_API_KEY"]}&units=imperial")

denver_weather = response.parse
pp denver_weather

puts "Welcome to Denver Weather"
puts "Today will have a high of #{denver_weather["main"]["temp_max"]} and a low of #{denver_weather["main"]["temp_min"]} with #{denver_weather["weather"][0]["description"]}"
puts "The humidity for today will be #{denver_weather["main"]["humidity"]}% with wind speed of #{denver_weather["wind"]["speed"]}"
