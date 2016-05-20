require 'Faker'

5.times.map do
  User.create(username: Faker::Name.name, email: Faker::Internet.email, password: "123")
end

Dog.create(name: "Jayda", breed: "Golden Retriever", age: 2, temperment: "shy", owner_id: 1)
Dog.create(name: "Tenley", breed: "Pug", age: 14, temperment: "sharp", owner_id: 2)
Dog.create(name: "Link", breed: "Muppet", age: 1, temperment: "sound", owner_id: 3)
Dog.create(name: "Rocco", breed: "Chihuahua", age: 13, temperment: "submissive", owner_id: 4)
Dog.create(name: "Ella", breed: "Yellow Lab", age: 11, temperment: "sharp-shy", owner_id: 5)


Playdate.create(group_name: "Doggie Daycare", location: "Petaluma, CA", meet_time: "Saturdays at 9am", creator_id: rand(1..5))

# Matchup.create(dog_id: rand(1..5), playdate_id: 1)
