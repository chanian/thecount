TheCount Gem
====================
Provides a simple interface for counting and reporting arbitrary things on the web

Sample Usage
-------------------
  # Setup a counting request
  data = TheCount::count(
      # What do we want to count
      [ TheCount::Twitter,
      TheCount::Facebook,
      TheCount::LinkedIn],

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
