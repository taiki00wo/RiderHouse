# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
name: "guest",
email: "guest@example.com",
password: 'password', 
bike_name: 'cb400sf',
location: '東京都',
gender: '男',
age: '23',
favorite_load: 'オロロンライン',
when_ride: '2018年4月から',
twitter_id: '@xxxxxxxx',
image: open("#{Rails.root}/db/images/user_default.jpeg"))

User.create!(
name: "test1",
email: "test1@email.com",
password: 'password', 
bike_name: 'gsx400',
location: '大阪府',
gender: '男',
age: '30',
favorite_load: 'オロロンライン',
when_ride: '2015年4月から',
twitter_id: '@xxxxxxxx',
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
twitter_id: '@xxxxxxxx',
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
twitter_id: '@xxxxxxxx',
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


Post.create!(rating: 5, content: "料理が美味しかった。", user_id: 1, riderhouse_id: 2)
Post.create!(rating: 4, content: "景色が綺麗", user_id: 2, riderhouse_id: 5)
Post.create!(rating: 5, content: "掃除が行き届いている", user_id: 3, riderhouse_id: 6)
Post.create!(rating: 4, content: "おすすめです。", user_id: 1, riderhouse_id: 9)
Post.create!(rating: 5, content: "とてもいい。また来たいです。", user_id: 2, riderhouse_id: 10)
Post.create!(rating: 4, content: "いい感じのライダーハウスです。", user_id: 3, riderhouse_id: 1)
Post.create!(rating: 3, content: "近くにコンビニがあります。", user_id: 2, riderhouse_id: 4)
Post.create!(rating: 4, content: "普通のライダーハウスです", user_id: 2, riderhouse_id: 5)
Post.create!(rating: 3, content: "普通", user_id: 1, riderhouse_id: 7)
Post.create!(rating: 1, content: "あまり良くない", user_id: 1, riderhouse_id: 1)
Post.create!(rating: 2, content: "連絡しても、電話に出なかった。", user_id: 3, riderhouse_id: 3)
Post.create!(rating: 1, content: "いびきがうるさい人がいた", user_id: 2, riderhouse_id: 5)
Post.create!(rating: 2, content: "あまり良くない", user_id: 2, riderhouse_id: 2)
Post.create!(rating: 1, content: "場所がわかりずらい", user_id: 3, riderhouse_id: 8)


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

Message.create!(content: 'こんにちは', from_id: 1, to_id: 2, room_id: 1)
Message.create!(content: 'よろしく', from_id: 2, to_id: 1, room_id: 1)
Message.create!(content: '初めまして', from_id: 2, to_id: 3, room_id: 1)
Message.create!(content: 'こちらこそ', from_id: 3, to_id: 2, room_id: 1)
Message.create!(content: 'よろしくお願いします。', from_id: 3, to_id: 1, room_id: 1)
Message.create!(content: 'こちらこそ', from_id: 1, to_id: 3, room_id: 1)
