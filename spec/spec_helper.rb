require 'rspec'
require 'pg'
require 'line'
require 'station'
require 'train'
require 'rider'
require 'operator'
require 'pry'

DB = PG.connect({:dbname => 'train_station_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("TRUNCATE TABLE line RESTART IDENTITY;")
    DB.exec("TRUNCATE TABLE station RESTART IDENTITY;")
    DB.exec("TRUNCATE TABLE train RESTART IDENTITY;")
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
end
