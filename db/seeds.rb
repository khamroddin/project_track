# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
User.create(name: 'admin', role_id: 1,email: 'khamar.md@gmail.com', password: 'admin123')
User.create(name: 'emp', role_id: 2,email: 'khamar.md@arrowad.org', password: 'emp123')
Role.create(name: 'admin',status: true)

locations = Location.create([{name: 'Banglore'},{name: 'Chennai'},{name: 'Hyderabad'},{name: 'Kochi'}])
