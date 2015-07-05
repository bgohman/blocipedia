User.destroy_all
Wiki.destroy_all 

 require 'faker'

# Create Users

  standard = User.new(
    name:     "standard user",
    email:    "standard@example.com",
    password: "helloworld",
    role:     "standard"
  )
  standard.skip_confirmation!
  standard.save!

  premium = User.new(
    name:     "premium user",
    email:    "premium@example.com",
    password: "helloworld",
    role:     "premium"
  )
  premium.skip_confirmation!
  premium.save!  

  admin = User.new(
    name:     "admin user",
    email:    "admin@example.com",
    password: "helloworld",
    role:     "admin"
  )
  admin.skip_confirmation!
  admin.save!
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
