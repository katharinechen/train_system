require 'pg'
require 'pry'
require './lib/line'
require './lib/station'
require './lib/train'
require './lib/rider'
require './lib/operator'

DB = PG.connect({:dbname => 'train_station'})


  def database_insert

    #database for table "Line"
    DB.exec("INSERT INTO line (name) VALUES ('Yellow');")
    DB.exec("INSERT INTO line (name) VALUES ('Green');")
    DB.exec("INSERT INTO line (name) VALUES ('Red');")
    DB.exec("INSERT INTO line (name) VALUES ('Blue');")

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


def main_menu
  system 'clear'
  puts "Welcome."
  puts "Press 'O' if you are an operator."
  puts "Press 'R' if you are a rider."
  puts "Press 'P' to populate database with Portland Metro Date."
  status = gets.chomp.downcase

  if status == "o"
    operator_menu
  elsif status == "r"
    # rider_menu
  elsif status == "p"
    database_insert
    puts "You have successfully populated your database with Portland Metro Data."
    sleep 2.0
    main_menu
  else
    puts "Please enter a valid option."
  end
end

def operator_menu
  system 'clear'
  puts "Welcome Operator!"
  puts "Would you like to work with trains, stations, or train lines??"
  puts "Press 'T' for trains."
  puts "Press 'S' for stations"
  puts "Press 'L' for train lines."
  answer = gets.chomp.downcase

  if answer == "t"
  elsif answer == "s"
    station_menu
  elsif answer == "l"
  else
    puts "Please enter a valid option."
  end
end

def station_menu
  system 'clear'
  puts "Welcome Operator to the Station Menu!"
  puts "Press 'C' to create a new train station."
  puts "Press 'R' to view all of the train stations"
  puts "Press 'D' to delete a station."
  answer = gets.chomp.downcase

  if answer == "c"
    station_list
    create_new_station
    station_list
    return_to_station_menu
  elsif answer == "r"
    station_list
    return_to_station_menu
  elsif answer == "d"
    station_list
    delete_station
    station_list
    return_to_station_menu
  else
    puts "Please enter a valid option."
  end
  ## create, read, update, and destroy stations
  ## add/delete/show/edit lines
  ## reschedule/show trains
end

def station_list
  puts "Here is the current list of all the stations in Portland:"
  station_names = []
  station_object_array = Station.all

  station_object_array.each do |station|
    station_names << station.name
  end
  puts station_names
end

def create_new_station
  puts "Please enter the name of the station you want to create."
  name = gets.chomp.capitalize
  new_station = Station.new({'name' => "#{name}"})
  new_station.create_new
  puts " "
  puts "You have successfully added #{name}."
end

def delete_station
  puts "Please enter the name of the station you want to delete."
  name = gets.chomp.capitalize
  Station.delete(name)


#delete from line_station as well

end

def return_to_station_menu
  puts "Please 'm' to go back to the menu."
  result = gets.chomp
  if result == 'm'
    station_menu
  end
end
main_menu

# def rider_menu
#   ##view train_lines (to see where train stops)
#   #view train_station (to which trains pass through)
# end
