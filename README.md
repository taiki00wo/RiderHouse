# アプリケーションの概要
ライダーハウスの口コミをみんなで共有するサイトです。  
バイクが好きなので、webアプリのテーマとして選びました。　

# 使用した技術
Ruby 2.6.4  
Rails 6.0.0  

rspec+capybarafactory_bot_rails  

bootstrap  
devise  
carrierwave  
kaminari  
geocoder  
gon  
dotenv-rails  
rubocop-rails  

# 実装した機能
・ユーザー  
  新規登録、編集、ログイン、ログアウト、退会
・ライダーハウス  
  一覧表示、新規登録、編集、詳細表示、削除、検索、ソート
・口コミ  
  投稿  
・お気に入り  
  一覧表示、登録、登録解除  
・API  
  googlemap, openweathermap
  
# 工夫した点
・rspecによる、controllerとmodelのテスト  
・背景画像を透過させるために、バックグラウンドマスクを使用した。  
・お気に入り登録・解除をajaxで実装  
 初めてajaxを実装したが、  
・お気に入りの数でソート  
 ransackのソートはテーブルの各カラムならすぐ実装できるが、assosiationを使って関連付けているテーブルだと  
 使用することができない。そこで、SQLのGROUPとCOUNT、ORDERでライダーハウスのお気に入りの数で実装した。  
・googlemapの中心位置を位置情報に設定する。  
  
# 苦労した点  
・rails6でアプリを作成したが、リリースしたばかりだったので、ドキュメントが少なかった。  
 bootstrapやjqueryの導入で苦労した。  
・herokuのデプロイでcssが崩れたり、背景画像が表示されないエラーが発生した。  
  
# 今後の課題  
・openweathermapの天気をajaxで変更できるようにする。  
 現在は固定で東京の天気を表示しているようにしているので、全国の天気をユーザーが選択して表示できるようにする。  
・herokuでのデプロイをawsに変更する  
・Twitterと連携する。(Twitterのdeveloperアカウントを作成するためには、英語で大量の文章を打つ必要があったため諦めてしまった。)  
 
