# 俳句アプリ

<a href="https://gyazo.com/028aeb19a7454c3a1c2b6151b11f8025"><img src="https://i.gyazo.com/028aeb19a7454c3a1c2b6151b11f8025.png" alt="Image from Gyazo" width="800"/></a>

<a href="https://gyazo.com/d589b1278b37b6eca8f8e4af74297043"><img src="https://i.gyazo.com/d589b1278b37b6eca8f8e4af74297043.png" alt="Image from Gyazo" width="600"/></a>


## アプリケーション概要  
現在地の位置情報を取得し、過去にその近くで詠まれた俳句をviewに表示させるように実装しました。位置情報を使った実装をしてみたいと思い、今いる場所で誰かが考えたことが知れたら面白いと思ったのでこのアプリケーションを作成しました。

## URL
https://haiku-27914.herokuapp.com/

## テスト用アカウント
* email  
t@t  
* password  
ta1234

## 目指した課題解決
現在地の近くの俳句を取得できるようにJavaScriptでGeolocationAPIを用いて、俳句を詠んでデータに保存させる際にgetCurrentPositionメソッドで現在地を一緒に保存させるようにし、また現在地を定期的に取得するためにwatchPositionメソッドを使い、現在地の近くで詠まれた俳句を取得できるようにし、その距離の指定をユーザーができるように実装しました。

## 工夫した点
GoogleCloudPlatformAPIを導入し、マイページにgoogleマップを表示させ、自分が詠んだ俳句を地図に紐づけて表示させるように実装した点です。

## 実装した機能についてのGIFと説明
* マイページに詠んだ俳句がmap上のマーカーで表示できるように実装しました。

<a href="https://gyazo.com/4cc63a3f3655043bd3f30bbd0b7592bc"><img src="https://i.gyazo.com/4cc63a3f3655043bd3f30bbd0b7592bc.gif" alt="Image from Gyazo" width="600"/></a>

* 俳句をアニメーションで表示させ、お気に入り数や詠んだ場所を表示できるように実装しました。

<a href="https://gyazo.com/f0e5804f32de0d2b76b82cbe2c98d76b"><img src="https://i.gyazo.com/f0e5804f32de0d2b76b82cbe2c98d76b.gif" alt="Image from Gyazo" width="600"/></a>

* 非同期通信でお気に入り機能を実装し、お気に入りの俳句で表示できます。

<a href="https://gyazo.com/5c486d97f88873ba982be3427cef9ca4"><img src="https://i.gyazo.com/5c486d97f88873ba982be3427cef9ca4.gif" alt="Image from Gyazo" width="600"/></a>

* 非同期通信でフォロー機能を実装し、友達リストで表示できます。

<a href="https://gyazo.com/b9b67b395efb36f9b0ebe6a3dfb21199"><img src="https://i.gyazo.com/b9b67b395efb36f9b0ebe6a3dfb21199.gif" alt="Image from Gyazo" width="600"/></a>

## データベース設計

### Userテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, unique:true|

#### Association

- has_many :haikus
- has_many :favorites, dependent: :destroy
- has_many :fav_haikus, through: :favorites, source: :haiku
- has_many :following_relationships, foreign_key: 'followed_id', class_name: 'Follow', dependent: :destroy
- has_many :followings, through: :following_relationships
- has_many :followed_relationships, foreign_key: 'following_id', class_name: 'Follow', dependent: :destroy
- has_many :followeds, through: :followed_relationships

### Haikuテーブル

|Column|Type|Option|
|------|----|------|
|kami|string|null: false|
|naka|string|null: false|
|simo|string|null: false|
|user_id|referemces||null: false, foreign_key: true|
|latitude|float|
|longitude|float|
|address|string|

#### Association

- has_many :favorites, dependent: :destroy
- has_many :users, through: :favorites
- belongs_to :user
- reverse_geocoded_by :latitude, :longitude
- after_validation :reverse_geocode

### Favoriteテーブル

|Column|Type|Option|
|------|----|------|
|user_id|referemces||null: false, foreign_key: true|
|haiku_id|referemces||null: false, foreign_key: true|
|:user_id, :haiku_id|index|unique: true|

#### Association

- belongs_to :user
- belongs_to :haiku


### Followテーブル

|Column|Type|Option|
|------|----|------|
|following|referemces||null: false, foreign_key: { to_table: :users }|
|followed|referemces||null: false, foreign_key: { to_table: :users }|
|:following, :followed|index|unique: true|

#### Association

- belongs_to :following, class_name: 'User'
- belongs_to :followed, class_name: 'User'
