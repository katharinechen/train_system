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

  # describe ".all_names_by_ids" do
  #   it 'returns an array with the names of all the respective ids' do
  #     station = Station.new({'name' => "Willow Creek"})
  #     station1 = Station.new({'name' => "Kenton Station"})
  #     station2 = Station.new({'name' => "Expo Center"})
  #     station.create_new
  #     station1.create_new
  #     station2.create_new
  #     expect(Station.all_names_by_ids([station.id, station2.id])).to eq [station.name, station2.name]
  #   end

  #   it "will not mess with the database if an entry does not exist" do
  #     station1 = Station.new({'name' => "Rockwood Station"})
  #     station1.create_new
  #     station2 = Station.new({'name' => "Expo Center"})
  #     Station.delete(station2.name)
  #     expect(Station.all).to eq [station1]
  #   end
  end
end
