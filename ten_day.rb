require 'httparty'

class TenDay
  def initialize(zip)
    @zip = zip
    @response = get_response
  end
end
