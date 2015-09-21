require 'httparty'

class CurrentCondition
  def initialize(zip)
    @zip = zip
    @response = get_response
  end

  def your_local_forecast
    @response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@zip}.json")
  end
end

puts "Enter a ZIP:"
api = CurrentCondition.new(gets.chomp)
puts api.your_local_forecast
