#テーブル設計

## users テーブル

|Column             |Type   |Options    |
|------------------ |------ |---------- |
|nickname           |string |null:false |
|email              |string |null:false |
|encrypted_password |string |null:false |
|first_name         |string |null:false |
|last_name          |string |null:false |
|first_name_kana    |string |null:false |
|last_name          |string |null:false |
|birth_id           |integer|null:false |

### Association

-has_many :items
-has_many :purchase_records
-belongs_to_active_hash :birth_id

## items テーブル

|Column                 |Type       |Options                       |
|-----------------------|-----------|------------------------------|
|product_name           |string     |null:false                    |
|product_description    |text       |null:false                    |
|price                  |integer    |null:false                    |
|category               |integer    |null:false                    |
|item_condition_type_id |integer    |null:false                    |
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
# -has_many :comments(追加実装のため、現時点ではしない)

## purchase_record テーブル

|Column|Type       |Options                        |
|------|-----------|-------------------------------|
|user  |references |null: false, foreign_key: true |
|item  |references |null: false, foreign_key: true |

### Association

-belongs_to :item
-belongs_to :user
-has_one :shipping_address

## shipping_address テーブル

|Column               |Type       |Options                       |
|---------------------|-----------|------------------------------|
|buyer_postal_code_id |string     |null:false                    |
|buyer_prefectures_id |string     |null:false                    |
|buyer_municipalities |string     |null:false                    |
|buyer_address        |string     |null:false                    |
|buyer_building_name  |string     |null:false                    |
|buyer_phone_number   |integer    |null:false                    |
|purchase_record      |references |null: false, foreign_key: true|

### Association

-belongs_to :purchase_record
-belongs_to_active_hash :buyer_postal_code_id
-belongs_to_active_hash :buyer_prefectures_id


## comments テーブル(追加実装のため、現時点ではしない)

|Column |Type       |Options                        |
|-------|-----------|-------------------------------|
|text   |text       |null: false                    |
|user   |references |null: false, foreign_key: true |
|item   |references |null: false, foreign_key: true |


### Association

-belongs_to :item
-belongs_to :user
