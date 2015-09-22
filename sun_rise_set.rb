require 'httparty'

class SunRiseSet
  def initialize(zip)
    @zip = zip
    @response = get_response
  end

  def sunrise
    @response["moon_phase"]["sunrise"]["hour"] + ":" + @response["moon_phase"]["sunrise"]["minute"]
  end

  def sunset
    @response["moon_phase"]["sunset"]["hour"] + ":" + @response["moon_phase"]["sunset"]["minute"]
  end

  def output
    "Sunrise: #{self.sunrise}\nSunset: #{self.sunset}"
  end

  private def get_response
    # key = ENV['WUNDERGROUND_KEY']
    # HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@zip}.json")
    file = File.read('astronomy.json')
    data_hash = JSON.parse(file)
  end
end
