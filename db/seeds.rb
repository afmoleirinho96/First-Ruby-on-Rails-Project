# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Generating 5 type of Kinds"
Kind.create!([{description:"Business"},
             {description:"Enterprise"},
             {description:"Commercial"},
             {description:"Friend"},
             {description:"Family"}])
puts "KINDs generator - DONE!"

=begin
puts "Generating 10 type of Contacts"
  20.times do |i|
   Contact.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    kind: Kind.all.sample,
    rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample)
    )
  end
puts "Contacts generator - DONE!"

=end