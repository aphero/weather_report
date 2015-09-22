require 'minitest/autorun'
require 'minitest/pride'
require './current_condition.rb'
require './ten_day.rb'
require './sun_rise_set.rb'
require './alert.rb'
require './hurricane.rb'
require 'json'
require 'httparty'

class TenDay
  private def get_response
    # key = ENV['WUNDERGROUND_KEY']
    # HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@zip}.json")
    file = File.read('10day.json')
    data_hash = JSON.parse(file)
  end
end

class CurrentCondition
  private def get_response
    # key = ENV['WUNDERGROUND_KEY']
    # HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@zip}.json")
    file = File.read('current.json')
    data_hash = JSON.parse(file)
  end
end

class SunRiseSet
  private def get_response
    # key = ENV['WUNDERGROUND_KEY']
    # HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@zip}.json")
    file = File.read('astronomy.json')
    data_hash = JSON.parse(file)
  end
end

class Alert
  private def get_response
    # key = ENV['WUNDERGROUND_KEY']
    # HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@zip}.json")
    file = File.read('alerts.json')
    data_hash = JSON.parse(file)
  end
end

class Hurricane
  private def get_response
    # key = ENV['WUNDERGROUND_KEY']
    # HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@zip}.json")
    file = File.read('hurricane.json')
    data_hash = JSON.parse(file)
  end
end

class WeatherReportTest < Minitest::Test

  def test_alert_exists_01
    assert Alert.new(27278)
  end

  def test_current_condition_exists_02
    assert CurrentCondition.new(27278)
  end

  def test_hurricane_exists_03
    assert Hurricane.new()
  end

  def test_sun_rise_set_04
    assert SunRiseSet.new(27278)
  end

  def test_ten_day_exists_05
    assert TenDay.new(27278)
  end

  def test_get_location_06
    loc = CurrentCondition.new(27278)
    assert_equal loc.location, "Hillsborough, NC"
  end

  def test_get_temp_07
    loc = CurrentCondition.new(27278)
    assert_equal loc.temp, 68.2
  end

  def test_get_humidity_08
    loc = CurrentCondition.new(27278)
    assert_equal loc.rel_humidity, "85%"
  end

  def test_get_wind_09
    loc = CurrentCondition.new(27278)
    assert_equal loc.wind, "NNE @ 4.0 mph"
  end

  def test_get_forecast_start_10
    loc = TenDay.new(27278)
    assert_equal loc.date, "7:00 PM EDT on September 21, 2015"
  end

  def test_get_10_day_forecast
    loc = TenDay.new(27278)
    assert_equal loc.forecast,
    "Monday
Showers ending early. Lows overnight in the low 60s.

Monday Night
Showers early, then cloudy overnight. Low 61F. Winds NNE at 5 to 10 mph. Chance of rain 50%.

Tuesday
Cloudy skies. Slight chance of a rain shower. High 77F. Winds NNE at 10 to 15 mph.

Tuesday Night
Mostly clear skies. Low 59F. Winds NNE at 5 to 10 mph.

Wednesday
Partly to mostly cloudy. High 79F. Winds NNE at 10 to 15 mph.

Wednesday Night
Mostly cloudy with some showers late. Low 57F. Winds light and variable. Chance of rain 50%.

Thursday
Considerable cloudiness with occasional rain showers. High 74F. Winds NE at 10 to 15 mph. Chance of rain 50%.

Thursday Night
Cloudy with showers. Low 61F. Winds NE at 5 to 10 mph. Chance of rain 40%.

Friday
Overcast with showers at times. High 73F. Winds NE at 5 to 10 mph. Chance of rain 70%.

Friday Night
Rain. Low near 60F. Winds NE at 5 to 10 mph. Chance of rain 80%. Rainfall around a quarter of an inch.

Saturday
Periods of rain. High 71F. Winds NE at 10 to 15 mph. Chance of rain 70%. Rainfall near a quarter of an inch.

Saturday Night
Steady light rain in the evening. Showers continuing late. Low 57F. Winds NNE at 5 to 10 mph. Chance of rain 60%.

Sunday
Rain early. A mix of sun and clouds in the afternoon. High 73F. Winds NNE at 10 to 15 mph. Chance of rain 60%.

Sunday Night
A few clouds. Low 56F. Winds NNE at 5 to 10 mph.

Monday
A few passing clouds, otherwise generally sunny. High 76F. Winds NNE at 5 to 10 mph.

Monday Night
A few clouds from time to time. Low 58F. Winds light and variable.

Tuesday
Mostly sunny skies. High 78F. Winds NNE at 5 to 10 mph.

Tuesday Night
Clear. Low 59F. Winds light and variable.

Wednesday
A few clouds from time to time. High 81F. Winds light and variable.

Wednesday Night
Partly cloudy skies early followed by increasing clouds with showers developing later at night. Low 59F. Winds light and variable. Chance of rain 40%.

"
  end

  def test_sunrise
    loc = SunRiseSet.new(27278)
    assert_equal loc.sunrise, "7:03"
  end

  def test_has_alerts
    loc = Alert.new(27278)
    assert loc.alerts?
  end

  def test_alerts_summary
    loc = Alert.new(27278)
    assert_equal loc.alert_report, "Heat Advisory
\u000A...Heat advisory remains in effect until 7 am CDT Saturday...\u000A\u000A* temperature...heat indices of 100 to 105 are expected each \u000A afternoon...as Max temperatures climb into the mid to upper \u000A 90s...combined with dewpoints in the mid 60s to around 70. \u000A Heat indices will remain in the 75 to 80 degree range at \u000A night. \u000A\u000A* Impacts...the hot and humid weather will lead to an increased \u000A risk of heat related stress and illnesses. \u000A\u000APrecautionary/preparedness actions...\u000A\u000AA heat advisory means that a period of hot temperatures is\u000Aexpected. The combination of hot temperatures and high humidity\u000Awill combine to create a situation in which heat illnesses are\u000Apossible. Drink plenty of fluids...stay in an air-conditioned\u000Aroom...stay out of the sun...and check up on relatives...pets...\u000Aneighbors...and livestock.\u000A\u000ATake extra precautions if you work or spend time outside. Know\u000Athe signs and symptoms of heat exhaustion and heat stroke. Anyone\u000Aovercome by heat should be moved to a cool and shaded location.\u000AHeat stroke is an emergency...call 9 1 1.\u000A\u000A\u000A\u000AMjb\u000A\u000A\u000A
"
  end

  def test_hurricane_name
    loc = Hurricane.new()
    assert_equal loc.storm_name, "Tropical Storm Ida"
  end

  def test_hurricane_list_of_names
    loc = Hurricane.new()
    assert_equal loc.storm_names, "Tropical Storm Ida
Invest 97L
Tropical Depression Twentyone
Tropical Storm Malia
Invest 96C
"
  end
end
