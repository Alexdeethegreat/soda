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
b = Artist.new
c = Song.new
s = Song.new 
u = User.new
n = Song.new
v = Song.new

a.assign_attributes(name: "Master P")
b.assign_attributes(name: "Linkin Park")
a.save
b.save

u.assign_attributes(name: "andrew", email: "agottlie@gmail.com")
u.save


s.assign_attributes(name: "Make em say uhhh", artist: a, votes: 10, user: u, spotify_id: "ABC")
s.save
c.save

v.assign_attributes(name: "Make em say uhhh", artist: a, votes: 10, user: u, spotify_id: "ABC")
v.save

n.assign_attributes(name: "New Song", artist: a, votes: 1, user: u)
n.save