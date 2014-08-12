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

  def save_new
    result = DB.exec("INSERT INTO station (name) VALUES ('#{name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def self.delete(name)
    DB.exec("DELETE FROM station WHERE name = '#{name}';") unless name == nil
  end

  def edit(new_name)
    @name = new_name
    DB.exec("UPDATE station SET name = '#{new_name}' WHERE id = #{id};")
  end

  def ==(another_station)
   name == another_station.name && id == another_station.id
  end

  def print_lines

    lines_array = []
    results = DB.exec( "
      SELECT station.* FROM
        line JOIN line_station ON (line.id = line_station.line_id)
             JOIN station ON (line_station.station_id = station.id)
        where line.id = #{@id};"
      )

    results.each do |object_hash|
      lines_array << object_hash["name"]
    end

    lines_array
  end
end
