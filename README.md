# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## items テーブル

|Column   |Type      |Options    |
|---------|----------|-----------|
| name    |string    |null: false|
|content  |text      |null: false|
|price    |integer   |null: false|
|category |integer   |null: false|
|situation|integer   |null: false|
|charge   |integer   |null: false|
|region   |integer   |null: false|
|how_long |integer   |null: false| 
|user     |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :ship
- has_one :purchase

## users　テーブル

|Column          |Type    |Options     |
|----------------|--------|------------|
|email           |string  |null: false, unique: true|
|nickname        |string  |null: false |
|first_name      |string  |null: false |
|last_name       |string  |null: false |
|first_name_kana |string  |null: false |
|last_name_kana  |string  |null: false |
|password        |string  |null: false |
|birth_day       |date |null:false  |

### Association
- has_many :items
- has_many :purchases

## ships テーブル

|Column     |Type       |Options     |
|---------|-----------|------------|
|post_code  |string    |null: false |
|prefecture  |integer    |null: false |
|region_id |integer    |null: false |
|manicipality|string |nulol: false|
|address     |string |null: false |
|add_address |string |            |
|tell_address |integer |null: false|
|user_id |references |null: false|
|item_id |references |null: false|

### Association
- belongs_to :item
- belongs_to :user
- has_one :purchase

## purchases テーブル

|Column     |Type       |Options     |
|-----------|-----------|------------|
|user       |references |foreign_key: true |
|item       |references |foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
