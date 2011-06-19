require 'open-uri'
require 'cgi'
require 'json'

module Socializer
  class Twitter < Countable
    def initialize
      @service_name = "twitter"
      @unit = "tweet"
      @value = 0
    end

    def count(data)
      url = data[:url]
      begin
        url = "http://urls.api.twitter.com/1/urls/count.json?url=#{url}"
        @value = JSON.parse(open(url).string)["count"].to_i
      rescue Exception => e
        p e
        @value = 0
      end
    end
  end
end
