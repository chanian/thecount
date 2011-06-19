require 'open-uri'
require 'cgi'
require 'json'

# Since Google is in between Buzz and +1, lets
# make no assumptions on a default and fully qualify both
module TheCount
  class Google
    class Buzz < TheCount::Countable
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