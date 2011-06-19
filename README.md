TheCount Gem
====================
Provides a simple interface for counting and reporting arbitrary things on the web

![Mascot](http://4.bp.blogspot.com/-TCPvrnG-KCs/TfMjpWepAKI/AAAAAAAAJWA/49r4o_q6JaA/s1600/TheCount.jpg)


Sample Usage
-------------------
    # Setup a counting request
    data = TheCount::count(
      # What do we want to count
      [ TheCount::Twitter, TheCount::Facebook, TheCount::LinkedIn ],
      
      # Where do we want to count it
      :url => "http://techcrunch.com/2011/06/16/rebecca-black-friday-video-no-longer-available-on-youtube/"
    )
    
    # Print out all the values
    data.each { |c|
      p "#{c.service_name} -> #{c.value}"
    }
    # (at the time of this example)
    # twitter -> 900
    # facebook -> 3000
    # linkedin -> 444

Notes
-------------------
This library essentially makes calls to the otherwise jsonp endpoint to the respective service. I've also purposely gone through the client api's like this to avoid the need to auth.