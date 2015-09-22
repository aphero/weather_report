require 'minitest/autorun'
require 'minitest/pride'
require './core.rb'

class WeatherReportTest < Minitest::Test

  def test_alert_exists_01
    assert Alert.new()
  end

  def test_current_condition_exists_02
    assert CurrentCondition.new(27278)
  end

  def test_hurricane_exists_03
    assert Hurricane.new()
  end

  def test_sun_rise_set_04
    assert SunRiseSet.new()
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

  # def test_
  #
  # end
end
