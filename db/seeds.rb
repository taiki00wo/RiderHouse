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

User.create!(
name: "test2",
email: "test2@email.com",
password: 'password', 
bike_name: 'ninja250',
location: '栃木県',
gender: '男',
age: '30',
favorite_load: '国道53号線',
when_ride: '2010年4月から',
image: open("#{Rails.root}/db/images/user_default.jpeg"))

User.create!(
name: "test3",
email: "test3@email.com",
password: 'password', 
bike_name: 'cbr250',
location: '北海道',
gender: '女',
age: '26',
favorite_load: 'ビーナスライン',
when_ride: '2017年4月から',
image: open("#{Rails.root}/db/images/user_default.jpeg"))


for i in 1..5 do
  Riderhouse.create!(name: "riderhouse#{i}", address: '東京都品川区南大井', 
  tel: '0000-11-2222', price: 2000, opening_hours: '7:00~18:00', 
  image: open("#{Rails.root}/db/images/riderhouse_default.jpeg"),
  user_id: 1)
end

for i in 6..10 do
  Riderhouse.create!(name: "riderhouse#{i}", address: '東京都港区南青山', 
  tel: '1111-11-2222', price: 4000, opening_hours: '7:00~20:00', 
  image: open("#{Rails.root}/db/images/riderhouse_default.jpeg"),
  user_id: 2)
end

for i in 11..15 do
  Riderhouse.create!(name: "riderhouse#{i}", address: '東京都港区南青山', 
  tel: '1111-11-2222', price: 10000, opening_hours: '7:00~20:00', 
  image: open("#{Rails.root}/db/images/riderhouse_default.jpeg"),
  user_id: 3)
end

for i in 1..15 do
  Post.create!(rating: 5, content: "とてもいい", user_id: 1, riderhouse_id: i)
end

for i in 1..15 do
  Post.create!(rating: 3, content: "普通", user_id: 2, riderhouse_id: i)
end

for i in 1..15 do
  Post.create!(rating: 5, content: "あまり良くない", user_id: 3, riderhouse_id: i)
end