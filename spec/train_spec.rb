require 'spec_helper'

describe :Train do
  it 'initializes an instance of the Train class' do
    expect(Train.new({})).to be_an_instance_of Train
  end

  it 'sets the train\'s line id' do
    expect(Train.new({line_id: 1}).line_id).to eq 1
  end

  it 'set the train\'s start time' do
    expect(Train.new({line_id: 1, start_time: "13:00:00.00"}).start_time).to eq("13:00:00.00")
  end

end


