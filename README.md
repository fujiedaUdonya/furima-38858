# README

# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false,              |
| email              | string              | null: false, unique: true |
| password           | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name_kana    | string              | null: false               |
| last_name_kana     | string              | null: false               |
| post_code          | string              | null: false               |
| city               | string              | null: false               |
| house_number       | string              | null: false               |
| building_name      | string              | null: false               |
| phone_number       | string              | null: false, unique: true |
| birth_date         | date                | null: false               |

### Association

* has_many :items
* has_one  :credit_cards

## items table

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| item_title          | string     | null: false                    |
| introduction        | text       | null: false                    |
| price               | integer    | null: false                    |
| condition           | integer    | null: false                    |
| shipping_from       | integer    | null: false                    | 
| shipping_charge     | integer    | null: false                    | 
| day_to_ship         | integer    | null: false                    | 

### Association

- belongs_to :user
- belongs_to :categories
- has_many   :images


## images table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| image       | string     | null: false                    |
| item        | references | null: false                    |

### Association

- belongs_to :items

## categories table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| name        | string     | null: false                    |
| item        | references | null: false                    |

### Association

- belongs_to :items


## credit_cards table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| customer_id | string     | null: false                    |
| card_id     | string     | null: false                    |
| user        | references | null: false                    |

### Association

- belongs_to :user



<!-- 
memo
| shipping_from       発送地域
| shipping_charge     送料負担
| day_to_ship         発送までの日数 -->
