require 'rspec'
require 'station'


describe 'Station' do
  it 'initializes an instance of the Station class' do
    expect(Station.new({name: "Happy Station"})).to be_an_instance_of Station
  end

  it 'sets its name to the value passed in a hash' do
    expect(Station.new({name: "Happy Station"}).name).to eq "Happy Station"
  end

end
