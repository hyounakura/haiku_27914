# 俳句アプリ

<a href="https://gyazo.com/d589b1278b37b6eca8f8e4af74297043"><img src="https://i.gyazo.com/d589b1278b37b6eca8f8e4af74297043.png" alt="Image from Gyazo" width="800"/></a>


## アプリケーション概要

## URL

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
