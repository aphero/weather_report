require 'httparty'

class TenDay
  def initialize(zip)
    @zip = zip
    @response = get_response
  end

  def forecast
    output = ""
    i = 0
    20.times do
      output << @response["forecast"]["txt_forecast"]["forecastday"][i]["title"] + "\n"
      output << @response["forecast"]["txt_forecast"]["forecastday"][i]["fcttext"] + "\n\n"
      i += 1
    end
    output
  end

  def date
    @response["forecast"]["simpleforecast"]["forecastday"][0]["date"]["pretty"]
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/forecast10day/q/#{@zip}.json")
  end
end
