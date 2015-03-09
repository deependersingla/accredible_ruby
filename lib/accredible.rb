require "accredible/version"

#errors
require 'accredible/errors/accredible_error'
#require 'accredible/errors/api_error'
require "accredible/errors/authentication_error"

module Accredible
  class << self
  	attr_accessor :api_key
  end

  def self.request(method, url, params={}, headers={}, api_base_url=nil)
  	unless api_key 
      raise AuthenticationError.new('No API key provided. ' \
        'Set your API key using "Accredible.api_key = <API-KEY>". ' \
        'You can get API keys from the Accredible web interface. ' \
        'See https://accredible.com for details, or email support@accredible.com ' \
        'if you have any questions.')
    end

    return "everything fine"
  end
end
