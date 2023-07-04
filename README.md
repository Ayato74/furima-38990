# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| name               | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth              | date    | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| price              | integer    | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| region_id          | integer    | null: false                    |
| num_of_days_id     | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :address

## addresses テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| post_code      | string  | null: false                    |
| prefecture_id  | integer | null: false                    |
| municipalities | string  | null: false, foreign_key: true |
| address_num    | string  | null: false, foreign_key: true |
| building_name  | string  | foreign_key: true              |
| tel_num        | string  | null: false, foreign_key: true |

### Association

- belongs_to :order
