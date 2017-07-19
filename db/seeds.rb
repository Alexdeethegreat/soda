# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.delete_all
Song.delete_all 

a = Artist.new
s = Song.new 

a.assign_attributes(name: "Master P", genre: "Gangsta Rap")
a.save
s.assign_attributes(name: "Make em say uhhh", artist: a)
s.save 