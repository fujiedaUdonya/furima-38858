# README

# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false,              |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name_kana    | string              | null: false               |
| last_name_kana     | string              | null: false               |
| birth_date         | date                | null: false               |

### Association

* has_many :items
* has_many :purchases

## items table

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| item_title          | string     | null: false                    |
| introduction        | text       | null: false                    |
| price               | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_from_id    | integer    | null: false                    | 
| shipping_charge_id  | integer    | null: false                    | 
| day_to_ship_id      | integer    | null: false                    | 
| category_id         | integer    | null: false                    | 
| user                | references | null: false,foreign_key: true  | 


### Association

- belongs_to :user
- has_one :purchase


## address table

| Column             | Type               | Options                        |
|--------------------|--------------------|--------------------------------|
| post_code          | string             | null: false                    |
| city               | string             | null: false                    |
| house_number       | string             | null: false                    |
| building_name      | string             | null: false                    |
| phone_number       | string             | null: false, unique: true      |
| purchases          | references         | null: false,foreign_key: true  | 

### Association

- belongs_to :purchases


## purchases table

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| user                | references | null: false,foreign_key: true  | 
| item                | references | null: false,foreign_key: true  | 
| address             | references | null: false,foreign_key: true  | 


### Association

- belongs_to :user
- belongs_to :items
- has_one    :address



<!-- 
memo
| shipping_from       発送地域
| shipping_charge     送料負担
| day_to_ship         発送までの日数
purchase             購入 -->
