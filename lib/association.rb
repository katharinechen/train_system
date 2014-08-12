class Association

  attr_reader :id, :line_id, :station_id

  def initialize(attributes)
    @id = attributes["id"].to_i
    @line_id = attributes["line_id"].to_i
    @station_id = attributes["station_id"].to_i
  end

  def self.all
    results = DB.exec("SELECT * FROM line_station;")
    associations = []
    results.each { |result| associations << Association.new(result) }
    associations
  end

  def save_new
    result = DB.exec("INSERT INTO line_station (line_id, station_id) VALUES (#{line_id}, #{station_id}) RETURNING id;")
    @id = result.first['id'].to_i
  end

  def self.delete(line_id, station_id)
    DB.exec("DELETE FROM line_station WHERE line_id = #{line_id} AND station_id = #{station_id};") unless name == nil
  end

  def edit(line_id, station_id)
    @line_id = line_id.to_i
    @station_id = station_id.to_i
    DB.exec("UPDATE line_station SET line_id = #{line_id} WHERE id = #{id};")
    DB.exec("UPDATE line_station SET station_id = #{station_id} WHERE id = #{id};")
  end

  def ==(another_association)
   name == another_association.name && id == another_association.id
  end

  # def print_lines

  #   lines_array = []
  #   results = DB.exec( "
  #     SELECT station.* FROM
  #       line JOIN line_station ON (line.id = line_station.line_id)
  #            JOIN station ON (line_station.station_id = station.id)
  #       where line.id = #{@id};"
  #     )

  #   results.each do |object_hash|
  #     lines_array << object_hash["name"]
  #   end

  #   lines_array
  # end
end
