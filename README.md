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
|user     |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :ship
- has_one :purchase

## users　テーブル

|Column          |Type    |Options     |
|----------------|--------|------------|
|email           |string  |null: false |
|nickname        |string  |null: false |
|first_name      |string  |null: false |
|last_name       |string  |null: false |
|first_name_kana |string  |null: false |
|last_name_kana  |string  |null: false |
|birth_year      |integer |null: false |
|birth_month     |integer |null:false  |
|birth_day       |integer |null:false  |

### Association
- has_many :items
- has_many :purchases

## ships テーブル

|Column     |Type       |Options     |
|---------|-----------|------------|
|charge   |integer    |null: false |
|region   |integer    |null: false |
|how_long |integer    |null: false |
|item     |references |foreign_key: true |

### Association
- belongs_to :item

## purchases テーブル

|Column     |Type       |Options     |
|-----------|-----------|------------|
|user       |references |foreign_key: true |
|item       |references |foreign_key: true |
|time_stamp |integer    |null: false |

### Association
- belongs_to :user
- belongs_to :item


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
