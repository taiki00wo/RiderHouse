# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Riderhouse.create(:name => '漁師の家', :address => '北海道稚内市ノシャップ2丁目3-8', :tel => '0162-22-0303', :price => 2000, :opening_hours => '8:00～17:00', image: 'ダウンロード.jpeg')
Riderhouse.create(:name => 'ライダーハウス 東京・世田谷 @貴庵', :address => '東京都世田谷区八幡山１丁目１８−２０', :tel => '012-92-0063', :price => 3000, :opening_hours => '8:00～18:00', image: 'ダウンロード.jpeg')


