require 'pg'

def Database

  def self.insert

    #all the lines
    DB.exec("INSERT INTO line (name) VALUES ('Yellow');")
    DB.exec("INSERT INTO line (name) VALUES ('Green');")
    DB.exec("INSERT INTO line (name) VALUES ('Red');")
    DB.exec("INSERT INTO line (name) VALUES ('Blue');")

    #all the stations
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

  end
end

# Lines:
# Yellow
# Green
# Red
# Blue

# Yellow
# Expo Center
# Pioneer Square
# PSU

# Red
# Airport
# Gateway
# Rose Quarter
# Beaverton

# Blue
# Gresham
# Beaverton
# Hillsboro

# Green
# Clackamas Town Center
# Rose Quarter
# PSU
