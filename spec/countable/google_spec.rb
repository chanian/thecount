require 'rspec'
require 'helper'

describe TheCount::Google::Buzz do
  describe "#initialize" do
    it "should set the correct defaults" do
      goog = TheCount::Google::Buzz.new

      goog.service_name.should eql "google"
      goog.unit.should eql "buzz"
      goog.value.should be 0
    end
  end
  describe "#count" do
    it "should return a non 0 integer for the count" do
      goog = TheCount::Google::Buzz.new
      goog.count({ :url => 'http://www.google.com/buzz' })
      goog.value.should > 0
    end
  end
end