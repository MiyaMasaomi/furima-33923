#テーブル設計

## users テーブル

|Column             |Type   |Options                 |
|------------------ |------ |------------------------|
|nickname           |string |null:false              |
|email              |string |null:false,unique: true |
|encrypted_password |string |null:false              |
|first_name         |string |null:false              |
|last_name          |string |null:false              |
|first_name_kana    |string |null:false              |
|last_name          |string |null:false              |
|birth_id           |date   |null:false              |

### Association

-has_many :items
-has_many :purchase_records

## items テーブル

|Column                 |Type       |Options                       |
|-----------------------|-----------|------------------------------|
|name                   |string     |null:false                    |
|description            |text       |null:false                    |
|price                  |integer    |null:false                    |
|category               |integer    |null:false                    |
|condition_type_id      |integer    |null:false                    |
|postage_id             |integer    |null:false                    |
|shipping_area_id       |integer    |null:false                    |
|days_to_ship_id        |integer    |null:false                    |
|user                   |references |null: false, foreign_key: true|

### Association

-belongs_to :user
-belongs_to_active_hash :category
-belongs_to_active_hash :item_condition_type
-belongs_to_active_hash :postage
-belongs_to_active_hash :shipping_area
-belongs_to_active_hash :days_to_ship
-has_one :purchase_record
# -has_many :comments(追加実装のため、現時点ではしない)

## purchase_record テーブル

|Column|Type       |Options                        |
|------|-----------|-------------------------------|
|user  |references |null: false, foreign_key: true |
|item  |references |null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one : :item
-has_one :shipping_address

## shipping_address テーブル

|Column          |Type       |Options                       |
|--------------- |-----------|------------------------------|
|postal_code_id  |string     |null:false                    |
|prefecture_id   |integer    |null:false                    |
|municipalities  |string     |null:false                    |
|address         |string     |null:false                    |
|building_name   |string     |                              |
|phone_number    |string     |null:false                    |
|purchase_record |references |null: false, foreign_key: true|

### Association

-belongs_to_active_hash :buyer_postal_code_id
-belongs_to_active_hash :buyer_prefecture_id
-has_one :purchase_record

## comments テーブル(追加実装のため、現時点ではしない)

|Column |Type       |Options                        |
|-------|-----------|-------------------------------|
|text   |text       |null: false                    |
|user   |references |null: false, foreign_key: true |
|item   |references |null: false, foreign_key: true |


### Association

-belongs_to :item
-belongs_to :user
