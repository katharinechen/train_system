require 'pry'

class Line
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id'].to_i
  end

  def self.all
    results = DB.exec("SELECT * FROM line;")
    lines = []
    results.each { |line| lines << Line.new(line)}
    lines
  end

  def ==(another_line)
    id == nil ? false : id == another_line.id
  end

  def create_new
    result = DB.exec("INSERT INTO line (name) VALUES ('#{name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def edit(new_name)
    result = DB.exec("UPDATE line SET name = '#{new_name}' WHERE id = #{id};") unless name == nil
  end

  def self.delete(name)
    DB.exec("DELETE FROM line WHERE name = '#{name}';")
  end

  def add_station(station_object)
    DB.exec("INSERT INTO line_station (line_id, station_id) VALUES (#{id}, #{station_object.id});") unless station_object.id == nil
  end

  def get_station_names
    results = DB.exec("SELECT * FROM line_station WHERE line_id = #{id};")
    stations_id = []
    results.each { |result| stations_id << result['station_id'].to_i }
    Station.all_names_by_ids(stations_id)
  end
end
