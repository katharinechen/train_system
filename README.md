# Train Stations

## About
This project was started by Justin Speers and Katharine Chen, and completed by [Katharine Chen](https://www.katharinechen.com) for the [Database basics assessment](http://www.learnhowtoprogram.com/lessons/database-basics-assessment).

## Description
Manages a train system consisting of lines, stations, and trains (of course).

## Installation
Clone this repository in your terminal.

	https://github.com/katharinechen/train_system.git

After install Postgres, enter the following code to create the appropriate database and files.

  psql
  CREATE DATABASE train_station;
  \c train_station;

  CREATE TABLE line (id serial PRIMARY KEY, name varchar);
  CREATE TABLE station (id serial PRIMARY KEY, name varchar);
  CREATE TABLE line_station (id serial PRIMARY KEY, line_id int, station_id);
  CREATE TABLE train (id serial PRIMARY KEY, line_id int);
  CREATE TABLE operator (id serial PRIMARY KEY, name varchar);
  CREATE TABLE rider (id serial PRIMARY KEY, name varchar);

After creating the necessary tables in the train_station database, clone the database for testing.

  CREATE DATABASE train_station_test WITH TEMPLATE train_station;

To run the program, run train_system.rb after installing Ruby.

  ruby train_system.rb

