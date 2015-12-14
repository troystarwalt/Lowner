# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
User.destroy_all
ItemShare.destroy_all
Item.destroy_all

# 15.times do |index|
# User.create!(
# 	username: Faker::Lorem.word,
# 	password: "password",
#  	first_name: Faker::Name.first_name, 
#  	last_name: Faker::Name.last_name,
#  	cell_phone: "217-821-3167",
#  	email: Faker::Internet.email,
#  	bio: Faker::Lorem.paragraph,
#  	)
# end

User.create!(
		email: "email@gmail.com",
	username: "zachzach",
	first_name: "Zach",
	last_name: "Feldman",
	password: "password",
	cell_phone: "2178213167",
	bio: Faker::Lorem.paragraph
	)

User.create!(
		email: "email1@gmail.com",
	username: "brianbrian",
	first_name: "Brian",
	last_name: "Fountain",
	password: "password",
	cell_phone: "2178213167",
	bio: Faker::Lorem.paragraph
	)

User.create!(
		email: "email2@gmail.com",
	username: "adamadam",
	first_name: "Adam",
	last_name: "Raider",
	password: "password",
	cell_phone: "2178213167",
	bio: Faker::Lorem.paragraph
	)

User.create!(
		email: "email3@gmail.com",
	username: "willwill",
	first_name: "Will",
	last_name: "Chinburg",
	password: "password",
	cell_phone: "2178213167",
	bio: Faker::Lorem.paragraph
	)

User.create!(
		email: "email4@gmail.com",
	username: "mandiemandie",
	first_name: "Mandie",
	last_name: "Williams",
	password: "password",
	cell_phone: "2178213167",
	bio: Faker::Lorem.paragraph
	)

User.create!(
		email: "email5@gmail.com",
	username: "jeremyjeremy",
	first_name: "Jeremy",
	last_name: "Snepar",
	password: "password",
	cell_phone: "2178213167",
	bio: Faker::Lorem.paragraph
	)

User.create!(
		email: "email6@gmail.com",
	username: "mikemike",
	first_name: "Mike",
	last_name: "Miller",
	password: "password",
	cell_phone: "2178213167",
	bio: Faker::Lorem.paragraph
	)

User.create!(
		email: "email7@gmail.com",
	username: "shannonshannon",
	first_name: "Shannon",
	last_name: "Krawitz",
	password: "password",
	cell_phone: "2178213167",
	bio: Faker::Lorem.paragraph
	)

User.create!(
		email: "email8@gmail.com",
	username: "victorvictor",
	first_name: "Victor",
	last_name: "Wang",
	password: "password",
	cell_phone: "2178213167",
	bio: Faker::Lorem.paragraph
	)

User.create!(
		email: "email9@gmail.com",
	username: "johnjohn",
	first_name: "John",
	last_name: "Wolfe",
	password: "password",
	cell_phone: "2178213167",
	bio: Faker::Lorem.paragraph
	)

User.create!(
		email: "email10@gmail.com",
	username: "ImADog",
	first_name: "Charles",
	last_name: "ZeDog",
	password: "password",
	cell_phone: "2178213167",
	bio: Faker::Lorem.paragraph
	)

User.create!(
		email: "email11@gmail.com",
	username: "stephsteph",
	first_name: "Stephanie",
	last_name: "Mathison",
	password: "password",
	cell_phone: "2178213167",
	bio: Faker::Lorem.paragraph
	)

User.create!(
	email: "troyst83@gmail.com",
	username: "troyst",
	first_name: "Troy",
	last_name: "Starwalt",
	password: "password",
	cell_phone: "2178213167",
	bio: Faker::Lorem.paragraph
	)

User.create!(
	email: "chopper@gmail.com",
	username: "chopper",
	first_name: "Helicopter",
	last_name: "Costuros",
	password: "password",
	cell_phone: "2178213167",
	bio: Faker::Lorem.paragraph
	)

p "Created #{User.count} users"