# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Song.delete_all 
Artist.delete_all
User.delete_all



a = Artist.new
s = Song.new 
u = User.new

a.assign_attributes(name: "Master P")
a.save

u.assign_attributes(name: "andrew", email: "agottlie@gmail.com")
u.save

s.assign_attributes(name: "Make em say uhhh", artist: a, user: u)
s.save

