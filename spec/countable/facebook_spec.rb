require 'rspec'
require 'helper'

describe TheCount::Facebook do
  describe "#initialize" do
    it "should set the correct defaults, and default to 'like'" do
      fb = TheCount::Facebook.new

      fb.service_name.should eql "facebook"
      fb.unit.should eql "like"
      fb.value.should be 0
    end
  end
  describe "#count" do
    it "should return a non 0 integer for the count" do
      fb = TheCount::Facebook.new
      fb.count({ :url => 'http://reddit.com' })
      fb.value.should > 0
    end
  end

  describe TheCount::Facebook::Comments do
    describe "#initialize" do
      it "should set the correct defaults" do
        fb = TheCount::Facebook::Comments.new

        fb.service_name.should eql "facebook"
        fb.unit.should eql "comment"
        fb.value.should be 0
      end
    end
    describe "#count" do
      it "should return a non 0 integer for the count" do
        url = 'http://techcrunch.com/2011/06/16/rebecca-black-friday-video-no-longer-available-on-youtube/'
        fb = TheCount::Facebook::Comments.new
        fb.count({ :url => url })
        fb.value.should > 0
      end
    end
  end
end