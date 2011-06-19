require 'open-uri'
require 'cgi'
require 'json'

module TheCount
  class Disqus < Countable
    def initialize
      @service_name = 'disqus'
      @unit = 'comment'
      @value = 0
    end

    def count(data)
      post_id = data[:post_id]
      domain = data[:domain]
      base_url = data[:base_url]
      begin
        url = "http://disqus.com/forums/#{domain}/count.js?q=1&1=1,#{post_id}%20#{CGI::escape(base_url)}&p=#{post_id}"
        @value = open(url).string.split('comments": ')[2].split("}")[0].to_i
      rescue Exception => e
        @value = 0
      end
    end
  end
end