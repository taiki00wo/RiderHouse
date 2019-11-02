# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |i|
user = "user_#{i}"
user = User.create!(name: "test#{i}", email: "test#{i}@email.com", password: 'password', 
image: open("#{Rails.root}/db/images/user_default.jpeg"))
end

10.times do |i|
riderhouse = "riderhouse_#{i}"
riderhouse = Riderhouse.create!(name: "riderhouse#{i}", address: '東京都品川区南大井', 
tel: '0000-11-2222', price: 2000, opening_hours: '7:00~18:00', 
image: open("#{Rails.root}/db/images/riderhouse_default.jpeg"),
user: user_1)
end

3.times do |i|
Post.create!(rating: 5, content: "とてもいい", user: user_1, riderhouse: riderhouse_1)
end