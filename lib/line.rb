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

  def save_new
    result = DB.exec("INSERT INTO line (name) VALUES ('#{name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def edit(new_name)
    @name = new_name
    result = DB.exec("UPDATE line SET name = '#{new_name}' WHERE id = #{id};") unless @name == nil
  end

  def self.delete(name)
    DB.exec("DELETE FROM line WHERE name = '#{name}';")
  end

  def ==(another_line)
    id == nil ? false : id == another_line.id
  end
end
