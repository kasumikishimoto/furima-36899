# テーブル設計


## usersテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| nickname   | string     | null: false |
| email      | string     | null: false |
| password   | string     | null: false |
| first_name | string     | null: false |
| birthday   | integer    | null: false |

## Association

- has_many : items
- has_many : comments


## itesmテーブル

| Column        | Type       | Options      |
| ------------- | ---------- | ------------ |
| image         |            | null: false  |
| title         | string     | null: false  |
| category      | string     | null: false  |
| description   | text       | null: false  |
| status        | string     | null: false  |
| shipping_fee  | integer    | null: false  |
| ship_from     | string     | null: false  |
| days_to_ship  | integer    | null: false  |
| price         | integer    | null: false  |
| user          | references | null: false  |

## Association

- belongs_to : user
- has_many : comments


## purchasesテーブル

| Column          | Type     | Options      |
| --------------- | -------- | ------------ |
| card_num        | integer  | null: false  |
| effective_date  | string   | null: false  |
| security_no     | integer  | null: false  |
| prefecure       | string   | null: false  |
| shipping_fee    | integer  | null: false  |
| ship_from       | string   | null: false  |
| days_to_ship    | integer  | null: false  |
| price           | integer  | null: false  |

# Association

- belongs_to : item
- belongs_to : user


## comments

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| user       | references |             |
| item       | references |             |

## Association

- belongs_to item
- belongs_to user