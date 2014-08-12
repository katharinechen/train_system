require 'spec_helper'

describe 'Station' do

  describe :initialize do
    it 'initializes an instance of the Station class' do
      expect(Station.new({'name' => "Expo Center"})).to be_an_instance_of Station
    end

    it 'sets its name to the value passed in a hash' do
      create_examples
      expect(@station1.name).to eq "Expo Center"
    end
  end

  describe ".all" do
    it 'returns an empty array at first' do
      expect(Station.all.length).to eq 0
    end

    it 'returns all the stations saved in the database' do
      create_examples
      expect(Station.all.length).to eq 4
    end
  end

  describe :save_new do
    it 'should save an object into the database' do
      @station1 = Station.new({"name" => "Expo Center"})
      @station1.save_new
      expect(Station.all.length).to eq 1
    end
  end

  describe ".delete" do
    it "will delete an exisiting section" do
      create_examples
      Station.delete("Expo Center")
      expect(Station.all.length).to eq 3
    end
  end

  describe :edit do
    it "will edit the name of an exisiting station entry in the database" do
      create_examples
      @station3.edit("Rockwood Station")
      expect(@station3.name).to eq "Rockwood Station"
    end
  end

  describe :print_lines do
    it "will print all of the stations that are associated with a line" do
      create_examples
      expect(@station1.print_lines).to eq [@station1.name, @station2.name, @station3.name, @station4.name]
    end
  end
end
