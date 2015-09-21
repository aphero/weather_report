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
    assert TenDay.new()
  end

  def test_get_location_06
    loc = CurrentCondition.new(27278)
    assert_equal loc.location, "Hillsborough, NC"
  end

  def test_get_temp
    loc = CurrentCondition.new(27278)
    assert_equal loc.temp, 68.2
  end

  def test_get_humidity
    loc = CurrentCondition.new(27278)
    assert_equal loc.rel_humidity, "85%"
  end

  def test_get_wind
    loc = CurrentCondition.new(27278)
    assert_equal loc.wind, "NNE @ 4.0 mph"
  end
end
