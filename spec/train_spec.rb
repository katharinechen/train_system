require 'spec_helper'

describe :Train do
  it 'initializes an instance of the Train class' do
    expect(Train.new({})).to be_an_instance_of Train
  end

  it 'sets the train\'s line id' do
    expect(Train.new({line_id: 1}).line_id).to eq 1
  end

end
