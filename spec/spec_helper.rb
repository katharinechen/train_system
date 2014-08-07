require 'rspec'
require 'pg'
require 'line'
require 'station'
require 'train'
require 'rider'
require 'operator'

DB = PG.connect({:dbname => 'train_station_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM line *;")
    DB.exec("DELETE FROM station *;")
    DB.exec("DELETE FROM train *;")
  end
end

