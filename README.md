#テーブル設計

## users テーブル

|Column             |Type   |Options                 |
|------------------ |------ |------------------------|
|nickname           |string |null:false              |
|email              |string |null:false,unique: true |
|password           |string |null:false              |
|first_name         |string |null:false              |
|last_name          |string |null:false              |
|first_name_kana    |string |null:false              |
|last_name_kana     |string |null:false              |
|birth_id           |date   |null:false              |

### Association

-has_many :items  
-has_many :orders

## items テーブル

|Column                 |Type       |Options                       |
|-----------------------|-----------|------------------------------|
|name                   |string     |null:false                    |
|description            |text       |null:false                    |
|price                  |integer    |null:false                    |
|category_id            |integer    |null:false                    |
|condition_type_id      |integer    |null:false                    |
|postage_id             |integer    |null:false                    |
|shipping_area_id       |integer    |null:false                    |
|days_to_ship_id        |integer    |null:false                    |
|user                   |references |null: false, foreign_key: true|

### Association
  
# ActiveHash
-belongs_to :category  
-belongs_to :condition_type  
-belongs_to :postage  
-belongs_to :shipping_area  
-belongs_to :days_to_ship  
  
-belongs_to :user  
-has_one :order  
-has_one_attached :image  

## orders テーブル

|Column|Type       |Options                        |
|------|-----------|-------------------------------|
|user  |references |null: false, foreign_key: true |
|item  |references |null: false, foreign_key: true |

### Association

-belongs_to :user  
-belongs_to :item  
-has_one :address

## address テーブル

### Association

-belongs_to :order

## order_address テーブル

|Column            |Type       |Options                       |
|----------------- |-----------|------------------------------|
|postal_code       |string     |null:false                    |
|shipping_area_id  |integer    |null:false                    |
|municipalities    |string     |null:false                    |
|purchaser_address |string     |null:false                    |
|building_name     |string     |                              |
|phone_number      |string     |null:false                    |
|order             |references |null: false, foreign_key: true|


# アプリケーション名
  フリマアプリのクローンサイト

## アプリケーション概要
  ユーザー登録をすれば、ものを出品したり出品されているものを買ったりすることができます

## URL
  18.178.224.109

## BASIC認証
ユーザー名：masaomi  
パスワード：1111

## テスト用アカウント
  ユーザー名：テスト太郎  
  メールアドレス：test1@sample.com  
  パスワード：aaaaa1  
  ユーザー名：テスト太郎２  
  メールアドレス：test2@sample.com  
  パスワード：aaaaa1  

## テスト決済用のカード情報
  カード情報：4242424242424242  
  セキュリティコード:123  
  有効期限：33年3月3日(現時点以降でも可)  

## 利用方法
  新規登録・ログインしていただき、商品を出品したり、購入したりすることができます。    
  また、ログインしていない方でも商品の詳細を見ることができます。

## 目指した課題解決
  家にある不要なものを必要と思っていただける方に売買ができるシステムです。

## 洗い出した要件
  ユーザー管理機能  
  商品出品機能  
  商品一覧表示機能  
  商品情報編集機能  
  商品詳細表示機能  
  商品削除機能  
  商品購入機能  
  S3、AWSの導入による画像保持機能

## 実装した機能についてのGIFと説明

  
## 実装予定の機能
  コメント投稿機能

## データベース設計
https://i.gyazo.com/d30577ba73f5386cc97dbef10d2fc44a.png

## ローカルでの動作方法


ruby 2.6.5  
rails 6.0.3.4  

git clone  

bundle install  

rails db:migrate  

rails s  
