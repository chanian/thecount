require 'rr'
require 'rspec'
require 'helper'

describe TheCount::Countable do
  describe "defaults" do
    it "should provide accessors to the basic variables" do
      c = TheCount::Countable.new
      c.respond_to?('service_name').should be true
      c.respond_to?('unit').should be true
      c.respond_to?('value').should be true
    end
  end

  describe "#count" do
    it "should raise an exception when explicitly called" do
      lambda {TheCount::Countable.new.count('')}.should raise_error
    end
  end
end
