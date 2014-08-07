require 'pg'

class Station

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id'].to_i
  end

  def write_new
    result = DB.exec("INSERT INTO station (name) VALUES ('#{name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def write_update
    # updates an entry in a DB with this id & name
  end

  def self.all
    results = DB.exec("SELECT * FROM station;")
    stations = []
    results.each {|result| stations << Station.new(result) }
    stations
  end

  def ==(another_station)
    name == another_station.name && id == another_station.id
  end
end
