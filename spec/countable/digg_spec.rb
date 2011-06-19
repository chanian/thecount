require 'rspec'
require 'helper'

describe TheCount::Digg do
  describe "#initialize" do
    it "should set the correct defaults" do
      digg = TheCount::Digg.new

      digg.service_name.should eql "digg"
      digg.unit.should eql "digg"
      digg.value.should be 0
    end
  end
  describe "#count" do
    it "should return a non 0 integer for the count" do
      digg = TheCount::Digg.new
      digg.count({ :url => 'http://reddit.com' })
      digg.value.should > 0
    end
  end
end