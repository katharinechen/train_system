require 'rspec'
require 'pg'
require 'line'
require 'station'
require 'train'

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM line *;")
    DB.exec("DELETE FROM station *;")
    DB.exec("DELETE FROM train *;")
  end
end

