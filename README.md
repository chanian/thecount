TheCount Gem
====================
Provides a simple interface for counting and reporting arbitrary things on the web

![Mascot](https://p.twimg.com/ASWtZF0CEAI90G-.png)

Installation
-------------------
    gem install thecount
    
Sample Usage
-------------------

    # Setup a counting request
    data = TheCount::count do |config|
      # What do we want to count
      config[:strategies] = [ TheCount::Twitter, TheCount::Facebook, TheCount::LinkedIn, TheCount::Google::Plus ]
  
      # Where do we want to count it
      config[:args] = { :url => "http://techcrunch.com/2011/06/16/rebecca-black-friday-video-no-longer-available-on-youtube/" }
    end

    # Print out all the values
    p "#{data[TheCount::Twitter].service_name} -> #{data[TheCount::Twitter].value}"
    p "#{data[TheCount::Facebook].service_name} -> #{data[TheCount::Facebook].value}"
    p "#{data[TheCount::LinkedIn].service_name} -> #{data[TheCount::LinkedIn].value}"
    p "#{data[TheCount::Google::Plus].service_name} -> #{data[TheCount::Google::Plus].value}"

    # (at the time of this example)
    # twitter -> 900
    # facebook -> 3000
    # linkedin -> 444
    # google -> 44

Supported Services
-------------------
  - **TheCount::Twitter** (Twitter Link Shares)
  - **TheCount::Facebook** (Facebook Likes)
  - **TheCount::Facebook::Comments** (Facebook Comment threads)
  - **TheCount::LinkedIn** (LinkedIn Shares)
  - **TheCount::Google::Buzz** (Google Buzzes)
  - **TheCount::Google::Plus** (Google Pluses)
  - **TheCount::Digg** (Digg diggs)

Tests
-------------------
To run the test suite run

    rake test

Notes
-------------------
This library essentially makes calls to the otherwise jsonp endpoint to the respective service. I've also purposely gone through the client api's like this to avoid the need to auth.