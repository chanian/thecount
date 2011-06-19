require 'open-uri'
require 'cgi'
require 'json'


# Since Google is in between Buzz and +1, lets
# make no assumptions on a default and fully qualify both
module Socializer
  class Google
    class Buzz < Countable
      def initialize
        @service_name = "google"
        @unit = "buzz"
        @value = 0
      end
      def count(data)
        url = data[:url]
        begin
          # and demeter cries
          @value = JSON.parse(open(url).string)["data"]["counts"].first.last[0]["count"].to_i
        rescue
          @value = 0
        end
      end
    end

    class PlusOne < Countable
      def initialize
        @service_name = "google"
        @unit = "+1"
        @value = 0
      end
    end
  end
end