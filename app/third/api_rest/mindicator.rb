require 'net/http'
require 'uri'
require 'json'

module ApiRest
  class Mindicator
    BASE_URL = 'https://mindicador.cl/api'

    def self.get_indicators
      uri = URI(BASE_URL)
      response = Net::HTTP.get_response(uri)

      if response.is_a?(Net::HTTPSuccess)
        json_response = JSON.parse(response.body)
        return json_response
      else
        return nil
      end
    rescue StandardError => e
      return e
    end
  end
end
