# テーブル設計

## users テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| nikckname          | string  | null: false                    |
| email              | string  | null: false, unique constraint |
| encrypted_password | string  | null: false                    |
| name               | string  | null: false                    |
| name_kana          | string  | null: false                    |
| birth_year         | integer | null: false                    |
| birth_month        | integer | null: false                    |
| birth_day          | integer | null: false                    |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| prace           | string     | null: false                    |
| image           | text       | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| region          | string     | null: false                    |
| num_of_days     | string     | null: false                    |
| commission      | decimal    | null: false                    |
| profit          | decimal    | null: false                    |
| seller_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| buyer_id      | integer    | null: false, foreign_key: true |
| item_id       | integer    | null: false, foreign_key: true |
| purchase_date | datetime   | null: false                    |

### Association

- belongs_to :user
- has_one :item
- has_one :address

## addresses テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| post_code      | string  | null: false |
| prefecture     | integer | null: false |
| municipalities | string  | null: false |
| address_num    | string  | null: false |
| building_name  | string  | null: false |
| tel_num        | string  | null: false |

### Association

- has_one :order
