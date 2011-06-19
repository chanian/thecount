TheCount Gem
====================
Provides a simple interface for counting and reporting arbitrary things on the web

![Mascot](http://4.bp.blogspot.com/-TCPvrnG-KCs/TfMjpWepAKI/AAAAAAAAJWA/49r4o_q6JaA/s1600/TheCount.jpg)

Installation
-------------------
    gem install thecount
    
Sample Usage
-------------------
    # Setup a counting request
    data = TheCount::count do |config|
      # What do we want to count
      config[:strategies] = [ TheCount::Twitter, TheCount::Facebook, TheCount::LinkedIn ]
      
      # Where do we want to count it
      config[:args] = { :url => "http://techcrunch.com/2011/06/16/rebecca-black-friday-video-no-longer-available-on-youtube/" }
    )
    
    # Print out all the values
    data.each { |count|
      p "#{count.service_name} -> #{count.value}"
    }
    # (at the time of this example)
    # twitter -> 900
    # facebook -> 3000
    # linkedin -> 444

Supported Services
-------------------
  - Twitter Link Shares
  - Facebook Likes
  - Facebook Comment threads
  - LinkedIn Shares
  - Google Buzzes
  - Digg diggs

Tests
-------------------
To run the test suite run

    rake test

Notes
-------------------
This library essentially makes calls to the otherwise jsonp endpoint to the respective service. I've also purposely gone through the client api's like this to avoid the need to auth.