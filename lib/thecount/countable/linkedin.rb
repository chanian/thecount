require 'open-uri'
require 'cgi'
require 'json'

module Socializer
  class LinkedIn
    def initialize
      @service_name = "linkedin"
      @unit = "share"
      @value = 0
    end

    def count(data)
      url = data[:url]
      begin
        url = "http://www.linkedin.com/countserv/count/share?url=#{url}"
        @value = JSON.parse(open(url).string.split("(")[1].split(");")[0])["count"].to_i
      rescue
        @value = 0
      end
    end
  end
end
