require 'minitest/autorun'
require 'minitest/pride'
require './current_condition.rb'
require './ten_day.rb'
require './sun_rise_set.rb'
require './alert.rb'
require './hurricane.rb'

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

  def test_get_data_06
    assert CurrentCondition.new(27278)
  end
end
