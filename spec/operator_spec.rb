require 'spec_helper'

describe :Operator do
  describe :initialize do
    it "should an instance of an Operator class" do
      expect(Operator.new({})).to be_an_instance_of Operator
    end
  end

end
