require 'spec_helper'

describe :Line do

  it 'initializes an instance of the Line class' do
    expect(Line.new({name: "Yellow"}))
  end

  it 'sets its name to the value passed in the hash' do
    expect(Line.new({name: "Yellow"}).name).to eq "Yellow"
  end
end
