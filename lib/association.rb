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

end
