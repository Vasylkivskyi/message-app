users = []

user = User.create(username: "Pavlo", password: "password")
users << user

5.times do
  user = User.create(username: Faker::Name.first_name, password: "password")
  users << user
end

15.times do
  user = users[rand(users.length)]
  puts user.inspect
  Message.create(
    body: Faker::Quotes::Shakespeare.as_you_like_it_quote,
    user: user
  )
end
