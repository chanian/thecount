require 'rspec'
require 'helper'

describe TheCount::Disqus do
  describe "#initialize" do
    it "should set the correct defaults" do
      t = TheCount::Disqus.new

      t.service_name.should eql "disqus"
      t.unit.should eql "comment"
      t.value.should be 0
    end
  end
  describe "#count" do
    it "should return a non 0 integer for the count" do
      t = TheCount::Disqus.new
      t.count({ :domain => 'techcrunch',
                :post_id => 58217
              })
      t.value.should > 0
    end
  end
end