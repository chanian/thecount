require 'open-uri'
require 'cgi'
require 'json'

module TheCount
  class TweetMeme < Countable
    def initialize
      @service_name = "tweetmeme"
      @unit = "tweet"
      @value = 0
    end

    def count(data)
      url = data[:url]
      url = "http://api.tweetmeme.com/url_info.json?url=#{url}"
      begin
        @value = JSON.parse(open(url).string)["story"]["url_count"].to_i
      rescue
        @value = 0
      end
    end
    end
  end
end