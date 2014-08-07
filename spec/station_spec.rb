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

  describe :write_new do
    it 'saves a new station to the database' do
      station = Station.new({'name' => "Beaverton TC"})
      station.write_new
      expect(Station.all).to eq [station]
    end
  end
end
