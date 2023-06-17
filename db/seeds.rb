users = []

user =
  User.create(
    username: "Pavlo",
    password: "password",
    image:
      "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80"
  )
users << user

5.times do
  user =
    User.create(
      username: Faker::Name.first_name,
      password: "password",
      image: "https://robohash.org/#{rand(1000...10_000)}?size=200x200&set=set2"
    )
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
