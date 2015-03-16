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

  URL = "https://staging.accredible.com"

  def self.request(method,url,payload=nil,headers={})
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
    elsif method == "post_local_file"
      response = post_local_file(url, payload)
    end
    
    unless response.code == '200'
      raise AuthenticationError.new(response.body.to_s +' email support@accredible.com ' \
        'if you have any questions.')
    end

    return response
  end

  def self.get_request(url)
    uri = URI(url) 
    https = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Get.new(uri) 
    req["Authorization"] = 'Token token=' + self.api_key
    https.use_ssl = true 
    response = https.request(req)
    response.code
    response.body
    return response
  end

  def self.post_request(url,payload)
    uri = URI(url) 
    https = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Post.new(uri.path) 
    req.body = payload.to_json
    req["Authorization"] = 'Token token=' + self.api_key
    req["Content-Type"] = "application/json"
    https.use_ssl = true 
    response = https.request(req)
    return response
  end

  def self.post_local_file(url, payload)
    require 'net/http/post/multipart'
    require 'json'
    url = URI.parse(url)
    req = Net::HTTP::Post::Multipart.new url.path, 
    "file" => UploadIO.new(File.new(payload[:file]), nil), 
    "evidence_item" => {description: payload[:description]}.to_json
    req["Authorization"] = 'Token token=' + self.api_key
    n = Net::HTTP.new(url.host, url.port)
    n.use_ssl = true
    res = n.start do |http|
      http.request(req)
    end
    return res
  end
end
