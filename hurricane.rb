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
    # key = ENV['WUNDERGROUND_KEY']
    # HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@zip}.json")
    file = File.read('hurricane.json')
    data_hash = JSON.parse(file)
  end
end
