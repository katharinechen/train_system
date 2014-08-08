require 'pg'

class Station

  attr_reader :name, :id, :line_id

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

  def self.all_names_by_ids(station_id_array)
    station_by_id_list = []
    self.all.each do |station|
      if station_id_array.include?(station.id)
        station_by_id_list << station.name
      end
    end
    puts station_by_id_list
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
