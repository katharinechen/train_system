require 'pg'

class Station

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id'].to_i
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

  def create_new
    result = DB.exec("INSERT INTO station (name) VALUES ('#{name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def edit(new_name)
    @name = new_name
    DB.exec("UPDATE station SET name = '#{new_name}' WHERE id = #{id};")
  end

  def delete
    DB.exec("DELETE FROM station WHERE id = #{id};") unless id == nil
  end
end
