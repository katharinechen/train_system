require 'spec_helper'
require 'pry'

# describe :Line do

#   describe :initialize do
#     it 'initializes an instance of the Line class' do
#       expect(Line.new({'name' => "Yellow Line"}))
#     end

#     it 'sets its name to the value passed in the hash' do
#       expect(Line.new({'name' => "Yellow Line"}).name).to eq "Yellow Line"
#     end
#   end

#   describe ".all" do
#     it 'returns no entries at first, given an empty database' do
#       expect(Line.all).to eq []
#     end

#     it 'returns all entries in the database as an array' do
#       line = Line.new({'name' => "Yellow Line"})
#       line1 = Line.new({'name' => "Green Line"})
#       line.create_new
#       line1.create_new
#       expect(Line.all).to eq [line, line1]
#     end
#   end

#   describe :create_new do
#     it 'adds an entry to the database' do
#       line = Line.new({'name' => 'Green Line'})
#       line.create_new
#       expect(Line.all[0]).to eq line
#     end
#   end

#   describe :edit do
#     it "updates an existing entry in the database" do
#       line = Line.new({'name' => 'Yellow Line'})
#       line.create_new
#       line.edit('Purple Line')
#       expect(Line.all[0].name).to eq 'Purple Line'
#     end
#   end

#   describe :add_station do
#     it "it adds a station to the line" do
#       line = Line.new({'name' => 'Yellow Line'})
#       line.create_new
#       station = Station.new({'name' => 'Pioneer Square'})
#       station.create_new
#       line.add_station(station)
#       expect(line.get_station_names).to eq [station.name]
#     end
#   end

#   describe :print_stations do
#     it "lists the stations that are part of the line" do
#       line = Line.new({'name' => 'Yellow Line'})
#       line.create_new
#       station = Station.new({'name' => 'Pioneer Square'})
#       station1 = Station.new({'name' => 'Rose Quarter'})
#       station2 = Station.new({'name' => 'Expo Center'})
#       station.create_new
#       station1.create_new
#       station2.create_new
#       line.add_station(station)
#       line.add_station(station1)
#       line.add_station(station2)
#       expect(line.get_station_names).to eq [station.name, station1.name, station2.name]
#     end
#   end
# end
