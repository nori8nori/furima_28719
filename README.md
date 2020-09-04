# テーブル設計

## users テーブル

| Column         | Type     | Options     |
| -------------- | -------- | ----------- |
| nickname       | string   | null: false |
| email          | string   | null: false |
| password       | string   | null: false |
| lastname       | string   | null: false |
| firstname      | string   | null: false |
| lastname_kana  | string   | null: false |
| firstname_kana | string   | null: false |
| birthday       | date     | null: false |

### Association

- has_many:items
- has_many:profiles

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| delivery_area_id   | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- has_one_attached:image

- belongs_to_active_hash:category
- belongs_to_active_hash:status
- belongs_to_active_hash:delivery_charge
- belongs_to_active_hash:deelivery_area
- belongs_to_active_hash:delivery_day

- belongs_to:user
- has_one:buy

## buy テーブル

| Column   | Type       | Options                    |
| ---- | ---------- | ------------------------------ |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association

- has_one:send
- belongs_to:item
- belongs_to:user

## sends テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postalcode       | string     | null: false                    |
| delivery_area_id | integer    | null: false                    |
| municipalties    | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| phone            | string     | null: false                    |
| profile          | references | null: false, foreign_key: true |

### Association

- belongs_to:buy
- belongs_to_active_hash:delivery_area