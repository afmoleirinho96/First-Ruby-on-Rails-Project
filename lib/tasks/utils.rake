namespace :utils do

  desc "Populate Database - Created from root" #Description of task
  task seed: :environment do
    puts "Generating Contacts..."
        20.times do |i|
        Contact.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          kind: Kind.all.sample,
          rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample)
        )
      end
    puts "Contacts generator - DONE!"

    puts "Generating Addresses (Addresses)... "
      Contact.all.each do |contact| ##
        Address.create!(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          contact: contact
        )
      end
    puts "Addresses generator - DONE!"


    puts "Generating Phones (Phones)... "
      Contact.all.each do |contact| ##
        Random.rand(1..5).times do |i| #pode ter de 1 a 5 telemóveis
          Phone.create!(
            phone: Faker::PhoneNumber.phone_number,
            contact: contact
          )
        end
    end
    puts "Phones generator - DONE!"
  end
end
