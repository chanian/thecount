require 'rspec'
require 'helper'

describe TheCount::Twitter do
  describe "#initialize" do
    it "should set the correct defaults" do
      t = TheCount::Twitter.new

      t.service_name.should eql "twitter"
      t.unit.should eql "tweet"
      t.value.should be 0
    end
  end
  describe "#count" do
    it "should return a non 0 integer for the count" do
      t = TheCount::Twitter.new
      t.count({ :url => 'http://google.com' })
      t.value.should > 0
    end
  end
end