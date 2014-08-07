

DB = PG.connect({:dbname => 'train_station'})


def main_menu

  puts "Welcome."
  puts "Press 'o' if you are an operator."
  puts "Press 'r' if you are a rider."
  status = gets.chomp.downcase

  if status == "o"
    operator_menu
  elsif status == "r"
    rider_menu
  else
    puts "Please enter a valid option."
  end
end

def operator_menu
  ## add/delete/show stations
  ## add/delete/show/edit lines
  ## reschedule/show trains
end

def rider_menu
  ##view train_lines (to see where train stops)
  #view train_station (to which trains pass through)
end


main_menu


