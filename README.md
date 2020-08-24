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

## データベース設計

### Userテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, unique:true|

#### Association

- has_many  :groups, through: :user_groups
- has_many  :user_groups
- has_many  :tasks, through: :user_task
- has_many  :user_tasks
