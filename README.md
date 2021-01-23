#テーブル設計

## users テーブル

|Column          |Type   |Options    |
|--------------- |------ |---------- |
|nickname        |string |null:false |
|email           |string |null:false |
|password        |string |null:false |
|first_name      |string |null:false |
|family_name     |string |null:false |
|first_name_kana |string |null:false |
|family_name     |string |null:false |
|birth_year      |date   |null:false |
|birth_month     |date   |null:false |
|birth_day       |date   |null:false |

### Association

-has_many :items
-has_many :purchase_record

## items テーブル

|Column              |Type       |Options                        |
|--------------------|-----------|-------------------------------|
|product_image       |string     |null:false                     |
|product_name        |string     |null:false                     |
|product_description |text       |null:false                     |
|price               |integer    |null:false                     |
|category            |references |null: false, foreign_key: true |
|item_condition_type |references |null: false, foreign_key: true |
|postage             |references |null: false, foreign_key: true |
|shipping_area       |references |null: false, foreign_key: true |
|days_to_ship        |references |null: false, foreign_key: true |
|user                |references |null: false, foreign_key: true |

### Association

-belongs_to :user
-has_many :comments
-belongs_to :category
-belongs_to :item_condition_type
-belongs_to :postage
-belongs_to :shipping_area
-belongs_to :days_to_ship

## category テーブル

|Column   |Type       |Options                        |
|---------|-----------|-------------------------------|
|category |string     |null:false                     |
|items    |references |null: false, foreign_key: true |

### Association

-belongs_to :items

## item_condition_type テーブル

|Column|Type       |Options                        |
|------|-----------|-------------------------------|
|name  |string     |null:false                     |
|items |references |null: false, foreign_key: true |

### Association

-belongs_to :items

## postage テーブル

|Column  |Type       |Options                        |
|--------|-----------|-------------------------------|
|postage |string     |null:false                     |
|items   |references |null: false, foreign_key: true |

### Association

-belongs_to :items

## shipping_area テーブル

|Column|Type       |Options                        |
|------|-----------|-------------------------------|
|area  |string     |null:false                     |
|items |references |null: false, foreign_key: true |

### Association

-belongs_to :items

## days_to_ship テーブル

|Column|Type|Options|
|------|-----------|-------------------------------|
|days  |string     |null:false                     |
|items |references |null: false, foreign_key: true |

### Association

-belongs_to :items

## purchase_record テーブル

|Column|Type       |Options                        |
|------|-----------|-------------------------------|
|user  |references |null: false, foreign_key: true |
|items |references |null: false, foreign_key: true |

### Association

-belongs_to :items
-belongs_to :user
-has_one :items
-belongs_to :shipping_address

## shipping_address テーブル

|Column               |Type       |Options                       |
|---------------------|-----------|------------------------------|
|buyer_postal_code    |integer    |null:false                    |
|buyer_prefectures    |string     |null:false                    |
|buyer_municipalities |string     |null:false                    |
|buyer_address        |integer    |null:false                    |
|buyer_building_name  |string     |null:false                    |
|buyer_phone_number   |integer    |null:false                    |
|user                 |references |null: false, foreign_key: true|

### Association

-belongs_to :purchase_record

## comments テーブル

|Column |Type       |Options                        |
|-------|-----------|-------------------------------|
|text   |text       |null: false                    |
|user   |references |null: false, foreign_key: true |
|items  |references |null: false, foreign_key: true |


### Association

-belongs_to :items
-belongs_to :user
