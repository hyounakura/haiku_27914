# 俳句アプリ

<a href="https://gyazo.com/028aeb19a7454c3a1c2b6151b11f8025"><img src="https://i.gyazo.com/028aeb19a7454c3a1c2b6151b11f8025.png" alt="Image from Gyazo" width="800"/></a>

<a href="https://gyazo.com/d589b1278b37b6eca8f8e4af74297043"><img src="https://i.gyazo.com/d589b1278b37b6eca8f8e4af74297043.png" alt="Image from Gyazo" width="600"/></a>


## アプリケーション概要  
現在地の位置情報を使い、過去にその近くで詠まれた俳句を取得しviewに表示させるように実装しました。位置情報を使った実装をしてみたいと思い、今いる場所で誰かが考えたことが知れたら面白いと思ったのでこのアプリケーションを作成しました。

## URL
https://haiku-27914.herokuapp.com/

## テスト用アカウント

## 目指した課題解決

## 工夫した点

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
