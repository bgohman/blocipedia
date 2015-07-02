User.destroy_all
Wiki.destroy_all 

 require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10),
    role:     "standard"
  )
  user.skip_confirmation!
  user.save!
end
  brad = User.new(
    name:     "Brad Gohman",
    email:    "bradley.s.gohman@gmail.com",
    password: "helloworld",
    role:     "admin"
  )
  brad.skip_confirmation!
  brad.save!
users = User.all

 # Create Wikis
 15.times do
  Wiki.create!(
    title:        Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    private: false
  )
 end
 


 
 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} users created"
