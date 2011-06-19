require 'open-uri'
require 'cgi'
require 'json'

module TheCount
  class Facebook < TheCount::Countable
    def initialize
      @service_name = "facebook"
      @unit = "like"
      @value = 0
    end

    def count(data)
      url = data[:url]
      url = "https://graph.facebook.com/#{url}"
      begin
        @value = JSON.parse(open(url).string)["shares"].to_i
      rescue
        @value = 0
      end  
    end

    # Some additional Facebook services
    class Sends < Countable
      def initialize
        @service_name = "facbeook"
        @unit = 'send'
        @value = 0
      end
    end

    class Comments < Countable
      def initialize
        @service_name = "facebook"
        @unit = "comment"
        @value = 0
      end

      def count(data)
        url = data[:url]
        query = CGI::escape("\"index_link_stat_url\":\"select url,commentsbox_count from link_stat where url=\\\"#{url}\\\"\"")
        url = "https://api-read.facebook.com/restserver.php?format=json&method=fql.multiquery&queries=%7B#{query}%7D"
        begin
          @value = JSON.parse(open(url).string)[0]["fql_result_set"][0]["commentsbox_count"].to_i
        rescue Exception => e
          @value = 0
        end
      end
    end

  end
end
