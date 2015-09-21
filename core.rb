require './current_condition.rb'
require './ten_day.rb'
require './sun_rise_set.rb'
require './alert.rb'
require './hurricane.rb'
require 'json'
require 'httparty'

puts "Enter a ZIP:"
api = CurrentCondition.new(gets.chomp)
puts "===================="
puts "Current conditions for #{api.location}"
puts "Temperature: #{api.temp} F"
puts "rH: #{api.rel_humidity}"
puts "Wind: #{api.wind}"
puts "===================="
