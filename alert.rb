require 'httparty'

class Alert
  def initialize(zip)
    @zip = zip
    @response = get_response
  end

  def alerts?
    @response["alerts"] != []
  end

  def alert_report
    output = ""
    @response["alerts"].each do |i|
      output << i["description"] + "\n"
      output << i["message"] + "\n"
    end
    output
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/alerts/q/#{@zip}.json")
  end
end
