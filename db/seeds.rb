# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



require 'csv'

#name,place,found_time,image,source,source_site,source_url,remark

CSV.foreach('./db/csv/npa.csv').each do |row|
  if $. == 1
    next
  end

  time = row[2].split('/')
  p time
  array = {
    name: row[0], place: row[1], found_time: DateTime.new(time[0].to_i,time[1].to_i,time[2].to_i), image: row[3], source:row[4], source_site: row[5], source_url: row[6], remark: row[7]
  }
  p array
  Item.create(array)

end

CSV.foreach('./db/csv/police.csv') do |row|
  if $. == 1
    next
  end

  time = row[2].split('/')
  puts time
  array = {
    name: row[0], place: row[1], found_time: DateTime.new(time[0].to_i+1911,time[1].to_i,time[2].to_i), image: row[3], source:row[4], source_site: row[5], source_url: row[6], remark: row[7]
  }
  puts array
  Item.create(array)

end

CSV.foreach('./db/csv/rails.csv') do |row|
  if $. == 1
    next
  end

  time = row[2].split('/')
  puts time
  array = {
    name: row[0], place: row[1], found_time: DateTime.new(time[0].to_i+1911,time[1].to_i,time[2].to_i), image: row[3], source:row[4], source_site: row[5], source_url: row[6], remark: row[7]
  }
  puts array
  Item.create(array)

end