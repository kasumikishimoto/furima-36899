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
- has_one : purchase_informations
- has_one : shipping_addresses
- has_many : comments


## itesmテーブル

| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| title          | string     | null: false                     |
| category_id    | integer    | null: false                     |
| description_id | integer    | null: false                     |
| status_id      | integer    | null: false                     |
| shipping_fee_id| integer    | null: false                     |
| ship_from_id   | integer    | null: false                     |
| day_to_ship_id | integer    | null: false                     |
| price          | integer    | null: false                     |
| user           | references | null: false, foreign_key: true  |

## Association

- belongs_to : user
- has_one : purchase_informations
- has_one : comments



## purchase_informations

| Column        | Type   | Options                       |
| ------------- | ------ | ----------------------------- |
| item          | string | null: false, foreign_key: true|
| user          | string | null: false, foreign_key: true|

## Association

- belongs_to : item
- belongs_to : user
- has_one : shipping_addresses



## shipping_addresses

| Column        | Type     | Options                        |
| ------------- | -------- | ------------------------------ |
| postal_code   | integer  | null: false                    |
| prefecture_id | integer  | null: false                    |
| municipality  | string   | null: false                    |
| address       | string   | null: false                    |
| building_name | string   |                                |
| phone_nu      | integer  | null: false                    |
| user          | string   | null: false, foreign_key: true |

## Association

- belongs_to : user


## comments

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| user       | references |             |
| item       | references |             |

## Association

- belongs_to : item
- belongs_to : user