require "accredible/version"



#add api files
require "accredible/api_resource"
require "accredible/evidence"

#add request files
require 'net/https'
require 'json'
require 'uri'

#errors
require 'accredible/errors/accredible_error'
#require 'accredible/errors/api_error'
require "accredible/errors/authentication_error"

module Accredible
  class << self
  	attr_accessor :api_key
  end

  def self.request(method, url, params={}, headers={})
  	unless api_key 
      raise AuthenticationError.new('No API key provided. ' \
        'Set your API key using "Accredible.api_key = <API-KEY>". ' \
        'You can get API keys from the Accredible web interface. ' \
        'See https://accredible.com for details, or email support@accredible.com ' \
        'if you have any questions.')
    end

    if method == "get"
      response = get_request(url)
    elsif method == "post"
      response  = post_request(url, payload)
    end

    if response.code == 400
      raise AuthenticationError.new('API key provided. is provided' \
        'Set your API key using "Accredible.api_key = <API-KEY>". ' \
        'You can get API keys from the Accredible web interface. ' \
        'See https://accredible.com for details, or email support@accredible.com ' \
        'if you have any questions.')
    end
  end

  def self.get_request(url)
    uri = URI(url) 
    https = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Get.new(uri.path) 
    req["Authorization"] = 'Token token=' + self.api_key
    https.use_ssl = true 
    response = https.request(req)
    response.code
    response.body
    return response
  end

  def self.post_request(url)
  end
  
end
