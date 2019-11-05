# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
name: "test1",
email: "test1@email.com",
password: 'password', 
bike_name: 'cb400sf',
location: '東京都',
gender: '男',
age: '23',
favorite_load: 'オロロンライン',
when_ride: '2018年4月から',
image: open("#{Rails.root}/db/images/user_default.jpeg"))



10.times do |i|
Riderhouse.create!(name: "riderhouse#{i}", address: '東京都品川区南大井', 
tel: '0000-11-2222', price: 2000, opening_hours: '7:00~18:00', 
image: open("#{Rails.root}/db/images/riderhouse_default.jpeg"),
user_id: 1)
end

3.times do |i|
Post.create!(rating: 5, content: "とてもいい", user_id: 1, riderhouse_id: 1)
end