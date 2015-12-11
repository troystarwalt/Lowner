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

15.times do |index|
User.create!(
	username: Faker::Lorem.word,
	password: "password",
 	first_name: Faker::Name.first_name, 
 	last_name: Faker::Name.last_name,
 	cell_phone: "217-821-3167",
 	email: Faker::Internet.email,
 	bio: Faker::Lorem.paragraph,
 	)
end

User.create!(
	email: "troyst83@gmail.com",
	username: "troyst",
	password: "password"
	)

User.create!(
	email: "chopper@gmail.com",
	username: "chopper",
	password: "password"
	)

p "Created #{User.count} users"