require 'rr'
require 'rspec'
require 'helper'

describe TheCount do
  describe "#count" do
    context "given a single strategy input" do
      it "should return an single array with an instance of the given stategy" do
        counts = TheCount::count do |config|
          config[:strategies] = TheCount::Twitter
          config[:args] = { :url => 'http://google.com' }
        end

        counts[0].kind_of?(TheCount::Twitter).should be true
      end
    end
    context "given multiple strategies as input" do
      it "should return an array of strategies" do
        counts = TheCount::count do |config|
          config[:strategies] = [TheCount::Facebook, TheCount::Twitter]
          config[:args] = { :url => 'http://google.com' }
        end

        counts.kind_of?(Array).should be true
        counts.size.should be 2
        counts[0].kind_of?(TheCount::Facebook).should be true
        counts[1].kind_of?(TheCount::Twitter).should be true
      end
    end
  end
end
