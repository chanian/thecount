require 'rspec'
require 'helper'

describe TheCount::LinkedIn do
  describe "#initialize" do
    it "should set the correct defaults" do
      li = TheCount::LinkedIn.new

      li.service_name.should eql "linkedin"
      li.unit.should eql "share"
      li.value.should be 0
    end
  end
  describe "#count" do
    it "should return a non 0 integer for the count" do
      li = TheCount::LinkedIn.new
      li.count({ :url => 'http://google.com' })
      li.value.should > 0
    end
  end
end