# テーブル設計


## usersテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| nickname             | string     | null: false                    |
| email                | string     | null: false, foreign_key: true |
| encrypted_password   | string     | null: false                    |
| first_name_kana      | string     | null: false                    |
| last_name_kana       | string     | null: false                    |
| first_name           | string     | null: false                    | 
| last_name            | string     | null: false                    |
| birthday             | date       | null: false                    |

## Association

- has_many : items
- has_many : purchase_informations
- has_many : comments


## itesmテーブル

| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| title          | string     | null: false                     |
| category_id    | integer    | null: false                     |
| description    | text       | null: false                     |
| status_id      | integer    | null: false                     |
| shipping_fee_id| integer    | null: false                     |
| prefecture_id  | integer    | null: false                     |
| day_to_ship_id | integer    | null: false                     |
| price          | integer    | null: false                     |
| user           | references | null: false, foreign_key: true  |

## Association

- belongs_to : user
- belongs_to : purchase_informations
- has_one : comments



## purchase_informations

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| item          | references | null: false, foreign_key: true|
| user          | references | null: false, foreign_key: true|

## Association

- belongs_to : item
- belongs_to : user
- has_one : shipping_address



## shipping_addresses

| Column                | Type     | Options                        |
| --------------------- | -------- | ------------------------------ |
| postal_code           | string   | null: false                    |
| prefecture_id         | integer  | null: false                    |
| municipality          | string   | null: false                    |
| address               | string   | null: false                    |
| building_name         | string   |                                |
| phone_nu              | string   | null: false                    |
| purchase_information  | string   | null: false, foreign_key: true |

## Association

- belongs_to : purchase_information

## comments

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| user       | references |             |
| item       | references |             |

## Association

- belongs_to : item
- belongs_to : user