require './current_condition.rb'
require './ten_day.rb'
require './sun_rise_set.rb'
require './alert.rb'
require './hurricane.rb'
require 'json'

puts "Enter a ZIP:"
zip = gets.chomp
current = CurrentCondition.new(zip)
puts "===================="
puts "Current conditions for #{current.location}"
puts "Temperature: #{current.temp} F"
puts "rH: #{current.rel_humidity}"
puts "Wind: #{current.wind}"
sunrise = SunRiseSet.new(zip)
puts "Sunrise: #{sunrise.sunrise}"
puts "Sunset: #{sunrise.sunset}"
puts "===================="
ten_day = TenDay.new(zip)
puts "Ten Day forecast:"
puts "#{ten_day.forecast}"
puts "===================="
alert = Alert.new(zip)
puts "Current alerts for your area:"
puts "#{alert.alert_report}"
puts "===================="
hurricanes = Hurricane.new()
puts "Currently active Tropical Storms and Hurricanes:"
puts "#{hurricanes.storm_names}"
