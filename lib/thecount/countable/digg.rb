require 'open-uri'
require 'cgi'
require 'json'

module TheCount
  class Digg
    def initialize
      @service_name = "digg"
      @unit = "digg"
      @value = 0
    end

    def count(data)
      url = data[:url]
      begin
        url = "http://widgets.digg.com/buttons/count?url=#{url}"
        @value = JSON.parse(open(url).string.split("(")[1].split(");")[0])["diggs"].to_i
      rescue
        @value = 0
      end
    end
  end
end
