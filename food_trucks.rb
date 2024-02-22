require "http"

response = HTTP.get("https://data.sfgov.org/resource/jjew-r69b.json").parse

i = 0
while i < 10
  food_truck = response[i]["applicant"]
  day = response[i]["dayofweekstr"]
  puts "#{food_truck} will be there on #{day}"
  i += 1
end
