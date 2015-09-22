require 'httparty'
require 'byebug'

class Hurricane
  def initialize
    @response = get_response
  end

  def storm_name
    @response["currenthurricane"][0]["stormInfo"]["stormName_Nice"]
  end

  def storm_names
    output = ""
    @response["currenthurricane"].each do |i|
      output << i["stormInfo"]["stormName_Nice"] + "\n"
    end
    output
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/currenthurricane/q/#{@zip}.json")
  end
end
