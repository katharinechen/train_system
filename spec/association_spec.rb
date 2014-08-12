require 'spec_helper'

describe 'Association' do

  describe :initialize do
    it 'initializes an instance of the Association class' do
      create_examples
      expect(@association1).to be_an_instance_of Association
    end

    it 'sets line_id and station_id to the valued passsed in the hash' do
      create_examples
      expect(@association1.line_id).to eq 1
      expect(@association1.station_id).to eq 1
    end
  end

  describe ".all" do
    it 'returns an empty array when no association is added to the database' do
      expect(Association.all.length).to eq 0
    end

    it 'returns all of the associations' do
      create_examples
      expect(Association.all.length).to eq 4
    end
  end

  describe :save_new do
    it 'should save an object into the database' do
      @association1 = Association.new({'line_id' => 1, "station_id" => 1})
      @association1.save_new
      expect(Association.all.length).to eq 1
    end
  end

  describe ".delete" do
    it "will delete an exisiting section" do
      create_examples
      Association.delete(1,1)
      expect(Association.all.length).to eq 3
    end
  end

  describe :edit do
    it "will edit the name of an exisiting station entry in the database" do
      create_examples
      @association1.edit(2,2)
      expect(@association1.line_id).to eq 2
    end
  end

end
