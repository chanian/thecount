require 'rr'
require 'rspec'
require 'helper'

describe TheCount do
  describe "#count" do
    context "given a single strategy input" do
      it "should return an object with an key-value pair for the strategy type" do
        counts = TheCount::count do |config|
          config[:strategies] = TheCount::Twitter
          config[:args] = { :url => 'http://google.com' }
        end
        counts.kind_of?(Object).should be true
        counts[TheCount::Twitter].kind_of?(TheCount::Twitter).should be true
      end
    end
    context "given multiple strategies as input" do
      it "should return an array of strategies" do
        counts = TheCount::count do |config|
          config[:strategies] = [TheCount::Facebook, TheCount::Twitter]
          config[:args] = { :url => 'http://google.com' }
        end

        counts.kind_of?(Object).should be true
        counts.keys.size.should be 2
        counts[TheCount::Facebook].kind_of?(TheCount::Facebook).should be true
        counts[TheCount::Twitter].kind_of?(TheCount::Twitter).should be true
      end
    end
  end
end
