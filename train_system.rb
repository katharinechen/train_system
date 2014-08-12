require 'pg'
require 'pry'
require './lib/line'
require './lib/station'

DB = PG.connect({:dbname => 'train_station'})

def database_insert
  #database for table "Line"
  DB.exec("INSERT INTO line (name) VALUES ('Yellow Line');")
  DB.exec("INSERT INTO line (name) VALUES ('Green Line');")
  DB.exec("INSERT INTO line (name) VALUES ('Red Line');")
  DB.exec("INSERT INTO line (name) VALUES ('Blue Line');")

  #data for table "Station"
  DB.exec("INSERT INTO station (name) VALUES ('Gresham');")
  DB.exec("INSERT INTO station (name) VALUES ('Gateway');")
  DB.exec("INSERT INTO station (name) VALUES ('Airport');")
  DB.exec("INSERT INTO station (name) VALUES ('Clackamas Town Center');")
  DB.exec("INSERT INTO station (name) VALUES ('Expo Center');")
  DB.exec("INSERT INTO station (name) VALUES ('Rose Quarter');")
  DB.exec("INSERT INTO station (name) VALUES ('PSU');")
  DB.exec("INSERT INTO station (name) VALUES ('Pioneer Square');")
  DB.exec("INSERT INTO station (name) VALUES ('Beaverton');")
  DB.exec("INSERT INTO station (name) VALUES ('Hillsboro');")

  #database for table for "line_station"
  DB.exec("INSERT INTO line_station (line_id, station_id) VALUES (1, 5);")
  DB.exec("INSERT INTO line_station (line_id, station_id) VALUES (1, 8);")
  DB.exec("INSERT INTO line_station (line_id, station_id) VALUES (1, 7);")
  DB.exec("INSERT INTO line_station (line_id, station_id) VALUES (3, 3);")
  DB.exec("INSERT INTO line_station (line_id, station_id) VALUES (3, 2);")
  DB.exec("INSERT INTO line_station (line_id, station_id) VALUES (3, 6);")
  DB.exec("INSERT INTO line_station (line_id, station_id) VALUES (3, 9);")
  DB.exec("INSERT INTO line_station (line_id, station_id) VALUES (4, 1);")
  DB.exec("INSERT INTO line_station (line_id, station_id) VALUES (4, 9);")
  DB.exec("INSERT INTO line_station (line_id, station_id) VALUES (4, 10);")
  DB.exec("INSERT INTO line_station (line_id, station_id) VALUES (2, 4);")
  DB.exec("INSERT INTO line_station (line_id, station_id) VALUES (2, 6);")
  DB.exec("INSERT INTO line_station (line_id, station_id) VALUES (2, 7);")
end

def header
  system 'clear'
  puts"
        ******************************
        ***       Trains           ***
        ******************************
  "
  puts ""
end

def main_menu
  header
  puts "Press '1' if you are an operator."
  puts "Press '2' to populate database with Portland Metro Date."
  status = gets.chomp.to_i

  if status == 1
    operator_menu
  elsif status == 2
    database_insert
    puts "You have successfully populated your database with Portland Metro Data."
    sleep 2.0
    main_menu
  else
    invalid_option
    main_menu
  end
end

def operator_menu
  header
  puts "What would you like to work with today?"
  puts "Press '1' for stations"
  puts "Press '2' for train lines."
  puts "Press '3' for station-train associations."
  answer = gets.chomp.to_i

  if answer == 1
    station_menu
  elsif answer == 2
    line_menu
  elsif answer == 3
    association_menu
  else
    invalid_option
    operator_menu
  end
end

def station_menu
  system 'clear'
  station_list
  puts "Press '1' to create a new train station."
  puts "Press '2' to delete a station."
  puts "Press '3' to return the the main menu."
  answer = gets.chomp.to_i

  if answer == 1
    puts "Please enter the name of the station you want to create."
    name = gets.chomp.capitalize
    new_station = Station.new({'name' => "#{name}"})
    new_station.save_new
    puts " "
    puts "You have successfully added #{name}."
    return_to_station_menu
  elsif answer == 2
    puts "Please enter the name of the station you want to delete."
    name = gets.chomp.capitalize
    Station.delete(name)
    return_to_station_menu
  elsif answer == 3
    operator_menu
  else
    invalid_option
    station_menu
  end
end

def station_list
  puts "Here is the current list of all the stations in Portland:"
  station_names = []
  station_object_array = Station.all
  station_object_array.each do |station|
    station_names << station.name
  end
  puts station_names
  puts " "
end

def return_to_station_menu
  puts "Please press '1' to go back to the menu."
  result = gets.chomp.to_i
  if result == 1
    station_menu
  else
    puts "Please enter a valid option."
  end
end

def line_menu
  system 'clear'
  line_list
  puts "Welcome Operator to the Line Menu!"
  puts "Press '1' to create a new line."
  puts "Press '2' to delete one of your lines."
  puts "Press '3' to return the the main menu."
  answer = gets.chomp.to_i

  if answer == 1
    puts "Please enter the name of line you want to create."
    result = gets.chomp
    new_line = Line.new({'name' => "#{result}"})
    new_line.save_new
    puts " "
    puts "You have successfully added #{result}."
    return_to_line_menu
  elsif answer == 2
    puts "Please enter the name of the line you want to delete."
    name = gets.chomp.capitalize
    Line.delete(name)
    return_to_line_menu
  elsif answer == 3
    main_menu
  else
    invalid_option
    line_menu
  end
end

def line_list
  puts "Here is the current list of all the lines in Portland:"
  line_list = []
  line_object_array = Line.all
  line_object_array.each do |line|
    line_list << line.name
  end
  puts line_list
  puts " "
end

def return_to_line_menu
  puts "Please press '1' to go back to the menu."
  result = gets.chomp.to_i
  if result == 1
    line_menu
  else
    "Please enter a valid option."
    sleep 1.0
    line_menu
  end
end

def association_menu
  system 'clear'
  association_list
  puts "Welcome Operator to the Association Menu!"
  puts "Press '1' to create a association."
  puts "Press '2' to delete one of your association."
  puts "Press '3' to return the the main menu."
  answer = gets.chomp.to_i

  if answer == 1

  elsif answer == 2

  elsif answer == 3
    main_menu
  else
    invalid_option
    association_menu
  end

end

def association_list

  #could replace with the print_line function
  x = 1
  (Line.all.length).times do
    results = DB.exec( "
      SELECT station.* FROM
        line JOIN line_station ON (line.id = line_station.line_id)
             JOIN station ON (line_station.station_id = station.id)
        where line.id = #{x};"
      )
    line = DB.exec("SELECT * FROM line WHERE id = #{x};")
    puts line[0]['name'] + ":"

    results.each do |object_hash|
      puts object_hash["name"]
    end

    puts " "
    x = x + 1
  end

end

def invalid_option
  puts "Please enter a valid option."
  sleep 1.0
end

main_menu
