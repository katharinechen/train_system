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
    result = DB.exec("UPDATE line SET name = '#{new_name}' WHERE id = #{id};")
  end
end
