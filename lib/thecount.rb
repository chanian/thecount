require 'thecount/countable'
require 'thecount/countable/twitter'
require 'thecount/countable/facebook'
require 'thecount/countable/linkedin'
require 'thecount/countable/disqus'
require 'thecount/countable/google'
require 'thecount/countable/digg'

module TheCount
  def self.count
    config = {}
    yield config

    strategies = config[:strategies]
    args = config[:args]

    strategies = [strategies] unless strategies.kind_of?(Array)
    results = {}
    strategies.each { |s|
      service = s.new
      service.count(args)
      results[s] = service
    }
    results
  end
end
