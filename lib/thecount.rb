require 'thecount/countable/twitter'
require 'thecount/countable/facebook'
require 'thecount/countable/linkedin'
require 'thecount/countable/disqus'
require 'thecount/countable/google'
require 'thecount/countable/digg'

module TheCount
  class Countable
    attr_reader :unit, :value, :service_name

    def count(url)
      raise "This countable object must have a count strategy implemented"
    end
  end

  def self.count(strategies, args)
    output = {}
    strategies.collect { |s|
      service = s.new
      service.count(args)
      service
    }
  end
end
