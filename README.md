# アプリケーションの概要  
ライダーハウスの口コミをみんなで共有するサイトです。  
バイクが好きで、ライダーハウスにも何回か泊まった事があるのですが、  
ライダーハウスを選ぶときに迷ったので、口コミサイトがあれば便利だと思い作成しました。  

  
# 使用した技術  
Ruby 2.6.4  
Rails 6.0.0  
  
rspec+capybara+factory_bot_rails  
  
webpacker  
bootstrap  
devise  
carrierwave  
kaminari  
geocoder  
gon  
dotenv-rails  
rubocop-rails  
  
# 実装した機能  
・ユーザー     新規登録、編集、ログイン、ログアウト、退会  
・ライダーハウス 一覧表示、新規登録、編集、詳細表示、削除、検索、ソート  
・口コミ       投稿  
・お気に入り    一覧表示、登録、登録解除  
・API         googlemap, openweathermap  
  
# 工夫した点  
・rspecでcontrollerとmodelのテストを実施した。     
・お気に入り登録・解除をajaxで実装した。      
・お気に入りの数でソート(ransackのソートはテーブルの各カラムならすぐ実装できるが、assosiationを使って関連付けているテーブルだと使用することができない。
そこで、SQLのGROUPとCOUNT、ORDERでライダーハウスのお気に入りの数で実装した。)  
・googlemapの中心位置を位置情報に設定する。(取得できなかった場合は、東京に設定。)    
・googlemapのライダーハウスの住所の位置にピンを表示する。  
・openweathermapの天気をajaxで変更できるようにする。  
・production環境での背景画像の表示。  
  
# 苦労した点  
・rails6がリリースしたばかりのため、ドキュメントが少なかったので、bootstrapやjqueryの導入で苦労した。rails5ではアセットを使用していたが、rails6では、webpackerとアセットの併用がデフォルトであり、統一するのに苦労した。  
・googlemapが正しく表示されないことがあった。(turbolinkを無効。callbackでinitMapを呼び出すことで解決。)  
  
# 今後の課題   
・herokuでのデプロイをawsに変更する。    
・Twitterと連携する。    
・gem geocoderが使用できない。(rails6が原因？)  
