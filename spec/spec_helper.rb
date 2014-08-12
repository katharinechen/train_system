require 'rspec'
require 'pg'
require 'line'
require 'station'
require 'association'
require 'pry'

DB = PG.connect({:dbname => 'train_station_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("TRUNCATE TABLE line RESTART IDENTITY;")
    DB.exec("TRUNCATE TABLE station RESTART IDENTITY;")
    DB.exec("TRUNCATE TABLE line_station RESTART IDENTITY;")
  end
end

def create_examples
  @station1 = Station.new({"name" => "Expo Center"})
  @station1.save_new
  @station2 = Station.new({"name" => "Willow Creek"})
  @station2.save_new
  @station3 = Station.new({"name" => "Kenton Station"})
  @station3.save_new
  @station4 = Station.new({"name" => "Beaverton TC"})
  @station4.save_new
  @line1 = Line.new({"name" => "Yellow Line"})
  @line1.save_new
  @line2 = Line.new({"name" => "Blue Line"})
  @line2.save_new
  @line3 = Line.new({"name" => "Purple Line"})
  @line3.save_new
  @line4 = Line.new({"name" => "Silver Line"})
  @line4.save_new

  DB.exec("INSERT INTO line_station(line_id, station_id) VALUES (1, 1);")
  DB.exec("INSERT INTO line_station(line_id, station_id) VALUES (1, 2);")
  DB.exec("INSERT INTO line_station(line_id, station_id) VALUES (1, 3);")
  DB.exec("INSERT INTO line_station(line_id, station_id) VALUES (1, 4);")

  @association1 = Association.new({'line_id' => 1, "station_id" => 1})
  @association2 = Association.new({'line_id' => 1, "station_id" => 2})
  @association3 = Association.new({'line_id' => 1, "station_id" => 3})
  @association4 = Association.new({'line_id' => 1, "station_id" => 4})
end
