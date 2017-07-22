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
Currentdate.delete_all



a = Artist.new
b = Artist.new
s = Song.new 
u = User.new
n = Song.new
d = Currentdate.new

a.assign_attributes(name: "Master P")
b.assign_attributes(name: "Linkin Park")
a.save
b.save

u.assign_attributes(name: "andrew", email: "agottlie@gmail.com", password: "hi")
u.save

s.assign_attributes(name: "Make 'Em Say Ugh", artist: a, votes: 0, user: u, spotify_id: "0l3wp8iEtN8rgag9eTeorW")
s.save

n.assign_attributes(name: "New Song", artist: a, votes: 0, user: u)
n.save

d.assign_attributes(date: "#{Time.now.strftime("%d/%m/%Y")}", song: "0l3wp8iEtN8rgag9eTeorW")
d.save