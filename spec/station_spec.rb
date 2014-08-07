require 'spec_helper'


describe 'Station' do
  it 'initializes an instance of the Station class' do
    expect(Station.new({name: "Expo Center"})).to be_an_instance_of Station
  end

  it 'sets its name to the value passed in a hash' do
    expect(Station.new({name: "Expo Center"}).name).to eq "Expo Center"
  end

  describe ".all" do
    it 'returns an empty array at first' do
      expect(Station.all).to eq []
    end

    # it 'returns all of the train stations in the database' do
    # end
  end
end
