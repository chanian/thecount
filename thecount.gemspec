Gem::Specification.new do |gem|
  gem.name        = 'thecount'
  gem.version     = '0.2'
  gem.date        = '2011-10-16'
  gem.summary     = "A simple generic counting service"
  gem.description = "Provides a simple interface for counting and reporting arbitrary things on the web"
  gem.author      = "Ian Chan"
  gem.email       = 'ianchan.can@gmail.com'
  gem.license     = 'MIT'
  gem.files       = `git ls-files`.split("\n")
  gem.require_paths = ['lib']
  gem.homepage    = 'http://github.com/chanian/thecount'
end
