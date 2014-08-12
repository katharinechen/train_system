require 'spec_helper'

describe :Line do

  describe :initialize do
    it 'initializes an instance of the Line class' do
      create_examples
      expect(@line1).to be_an_instance_of Line
    end

    it 'sets its name to the value passed in the hash' do
      create_examples
      expect(@line1.name).to eq "Yellow Line"
    end
  end

  describe ".all" do
    it 'returns no entries at first, given an empty database' do
      expect(Line.all).to eq []
    end

    it 'returns all entries in the database as an array' do
      create_examples
      expect(Line.all.length).to eq 4
    end
  end

  describe :save_new do
    it 'adds an entry to the database' do
      @line1 = Line.new({"name" => "Yellow Line"})
      @line1.save_new
      expect(Line.all.length).to eq 1
    end
  end

  describe :edit do
    it "updates an existing entry in the database" do
      create_examples
      @line4.edit("Rainbow Line")
      expect(Line.all.length).to eq 4
      expect(@line4.name).to eq "Rainbow Line"
    end
  end

  describe :delete do
    it "deletes an exisiting line in the database" do
      create_examples
      Line.delete("Purple Line")
      expect(Line.all.length).to eq 3
    end
  end
end
