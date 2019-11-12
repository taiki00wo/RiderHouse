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



Riderhouse.create!(name: "あづみのライダーズハウス",
  address: '〒399-8301 長野県安曇野市穂高有明２１８６−２６０', 
  latitude:36.5633486, longitude:138.613915,
  tel: '0000-11-2222', price: 2500, opening_hours: '7:00~20:00', 
  image: open("#{Rails.root}/db/images/riderhouse_default.jpeg"),
  user_id: 1)

Riderhouse.create!(name: "BikePack", 
  address: '〒410-2506 静岡県伊豆市徳永１８５−１', 
  latitude:34.9425317, longitude:139.0255593,
  tel: '0000-11-2222', price: 4000, opening_hours: '7:00~20:00', 
  image: open("#{Rails.root}/db/images/riderhouse_default.jpeg"),
  user_id: 1)

Riderhouse.create!(name: "ライダーハウスウィート", 
  address: '〒377-1712 群馬県吾妻郡草津町大字前口８−１', 
  latitude:36.5954473, longitude:138.5830834,
  tel: '0000-11-2222', price: 1000, opening_hours: '7:00~20:00', 
  image: open("#{Rails.root}/db/images/riderhouse_default.jpeg"),
  user_id: 1)

Riderhouse.create!(name: "ライダーハウス・タカ", 
  address: '〒413-0232 静岡県伊東市八幡野', 
  latitude:38.1889244, longitude:139.668301,
  tel: '0000-11-2222', price: 5000, opening_hours: '7:00~20:00', 
  image: open("#{Rails.root}/db/images/riderhouse_default.jpeg"),
  user_id: 1)

Riderhouse.create!(name: "ライダーハウス やどかり", 
  address: '〒415-0326 静岡県賀茂郡南伊豆町蛇石５９７−１４４', 
  latitude:35.3561, longitude:136.8337993,
  tel: '0000-11-2222', price: 3700, opening_hours: '7:00~20:00', 
  image: open("#{Rails.root}/db/images/riderhouse_default.jpeg"),
  user_id: 1)

Riderhouse.create!(name: "最北端 みつばちの家", 
  address: '〒097-0021 北海道稚内市港４丁目7-6', 
  latitude:45.400105, longitude:141.677199,
  tel: '0000-11-2222', price: 1200, opening_hours: '7:00~20:00', 
  image: open("#{Rails.root}/db/images/riderhouse_default.jpeg"),
  user_id: 2)

Riderhouse.create!(name: "旭温泉（道北）", 
  address: '〒098-3531 北海道遠別町旭294-2', 
  latitude:44.659942, longitude:141.860094,
  tel: '0000-11-2222', price: 6900, opening_hours: '7:00~20:00', 
  image: open("#{Rails.root}/db/images/riderhouse_default.jpeg"),
  user_id: 2)

Riderhouse.create!(name: "ライダーハウスD", 
  address: '〒841-0072 佐賀県鳥栖市村田町723-3 オートショップダイレクト', 
  latitude:33.356530, longitude:130.483407,
  tel: '0000-11-2222', price: 5600, opening_hours: '7:00~20:00', 
  image: open("#{Rails.root}/db/images/riderhouse_default.jpeg"),
  user_id: 2)

Riderhouse.create!(name: "下北山スポーツ公園", 
  address: '奈良県吉野郡下北山村上池原1026', 
  latitude:34.047777, longitude:135.962677,
  tel: '0000-11-2222', price: 2200, opening_hours: '7:00~20:00', 
  image: open("#{Rails.root}/db/images/riderhouse_default.jpeg"),
  user_id: 2) 

Riderhouse.create!(name: "ライダーハウスぱゆ", 
  address: '〒296-0112 千葉県鴨川市宮山1385', 
  latitude:35.121011, longitude:140.019388,
  tel: '0000-11-2222', price: 3300, opening_hours: '7:00~20:00', 
  image: open("#{Rails.root}/db/images/riderhouse_default.jpeg"),
  user_id: 3) 


for i in 1..10 do
  Post.create!(rating: 5, content: "とてもいい", user_id: 1, riderhouse_id: i)
end

for i in 1..10 do
  Post.create!(rating: 3, content: "普通", user_id: 2, riderhouse_id: i)
end

for i in 1..10 do
  Post.create!(rating: 5, content: "あまり良くない", user_id: 3, riderhouse_id: i)
end

Favorite.create!(user_id: 1, riderhouse_id: 1)
Favorite.create!(user_id: 1, riderhouse_id: 3)
Favorite.create!(user_id: 1, riderhouse_id: 4)
Favorite.create!(user_id: 1, riderhouse_id: 10)
Favorite.create!(user_id: 2, riderhouse_id: 3)
Favorite.create!(user_id: 2, riderhouse_id: 4)
Favorite.create!(user_id: 2, riderhouse_id: 6)
Favorite.create!(user_id: 2, riderhouse_id: 8)
Favorite.create!(user_id: 2, riderhouse_id: 9)
Favorite.create!(user_id: 3, riderhouse_id: 3)
Favorite.create!(user_id: 3, riderhouse_id: 5)
Favorite.create!(user_id: 3, riderhouse_id: 1)
Favorite.create!(user_id: 3, riderhouse_id: 8)
Favorite.create!(user_id: 3, riderhouse_id: 10)


