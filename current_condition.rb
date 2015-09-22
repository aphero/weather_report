require 'httparty'

class CurrentCondition
  def initialize(zip)
    @zip = zip
    @response = get_response
  end

  def location
    @response["current_observation"]["display_location"]["full"]
  end

  def temp
    @response["current_observation"]["temp_f"]
  end

  def rel_humidity
    @response["current_observation"]["relative_humidity"]
  end

  def wind
    "#{@response["current_observation"]["wind_dir"]} @ #{@response["current_observation"]["wind_mph"]} mph"
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{@zip}.json")
  end
end
