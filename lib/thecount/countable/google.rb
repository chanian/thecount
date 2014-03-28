require 'open-uri'
require 'cgi'
require 'json'

# Since Google is in between Buzz and +1, lets
# make no assumptions on a default and fully qualify both
module TheCount
  module Google
    class Plus < Countable
      def initialize
        @service_name = "google"
        @unit = "shares"
        @value = 0
      end
      def count(data)
        url = "https://plusone.google.com/u/0/_/+1/fastbutton?url="
        url = "#{url}#{CGI::escape(data[:url])}"
        begin
          # like penut butter brittle
          @value = open(url).string.split('window.__SSR = {')[1].split('};')[0].split("c:")[1].split(",")[0].strip.to_i
        rescue Exception => e
          puts e
          @value = 0
        end
      end
    end

    class Buzz < Countable
      def initialize
        @service_name = "google"
        @unit = "buzz"
        @value = 0
      end
      def count(data)
        url = "http://www.google.com/buzz/api/buzzThis/buzzCounter?url="
        url = "#{url}#{CGI::escape(data[:url])}"
        begin
          @value = JSON.parse(open(url).string.split('(')[1].split(')')[0])[data[:url]].to_i
        rescue Exception => e
          @value = 0
        end
      end
    end
  end
end
