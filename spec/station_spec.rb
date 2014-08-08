require 'spec_helper'
require 'pry'

describe 'Station' do

  describe :initialize do
    it 'initializes an instance of the Station class' do
      expect(Station.new({'name' => "Expo Center"})).to be_an_instance_of Station
    end

    it 'sets its name to the value passed in a hash' do
      station = Station.new({'name' => "Expo Center"})
      expect(station.name).to eq "Expo Center"
    end
  end

  describe ".all" do
    it 'returns an empty array at first' do
      expect(Station.all).to eq []
    end
  end

  describe ".all_names_by_ids" do
    it 'returns an array with the names of all the respective ids' do
      station = Station.new({'name' => "Willow Creek"})
      station1 = Station.new({'name' => "Kenton Station"})
      station2 = Station.new({'name' => "Expo Center"})
      station.create_new
      station1.create_new
      station2.create_new
      expect(Station.all_names_by_ids([station.id, station2.id])).to eq [station.name, station2.name]
    end

    it "will not mess with the database if an entry does not exist" do
      station1 = Station.new({'name' => "Rockwood Station"})
      station1.create_new
      station2 = Station.new({'name' => "Expo Center"})
      Station.delete(station2.name)
      expect(Station.all).to eq [station1]
    end
  end

  describe ".delete" do
    it "will edit an exisiting station with a specific name" do
      station = Station.new({'name' => "Willow Creek"})
      station1 = Station.new({'name' => "Kenton Station"})
      station.create_new
      station1.create_new
      Station.delete("Willow Creek")
      expect(Station.all).to eq [station1]
    end
  end

  describe :write_new do
    it 'saves a new station to the database' do
      station = Station.new({'name' => "Beaverton TC"})
      station.create_new
      expect(Station.all).to eq [station]
    end
  end

  describe :edit do
    it "will edit an exisiting station entry in the database" do
      station = Station.new({'name' => "Willow Creek"})
      station.create_new
      station.edit("Kenton Station")
      expect(station.name).to eq "Kenton Station"
      expect(Station.all).to eq [station]
    end
  end
end
