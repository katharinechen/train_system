require 'spec_helper'

describe :Rider do
  describe :initialize do
    it "should an instance of a Rider  class" do
      expect(Rider.new({})).to be_an_instance_of Rider
    end
  end

end
