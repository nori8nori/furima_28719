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
| birthday       | datetime | null: false |

### Association

- has_many:items
- has_many:profiles

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_explanation   | text       | null: false                    |
| category_id        | integer    | null: false, foreign_key: true |
| status_id          | integer    | null: false, foreign_key: true |
| delivery_charge_id | integer    | null: false, foreign_key: true |
| delivery_area_id   | integer    | null: false, foreign_key: true |
| delivery_day_id    | integer    | null: false, foreign_key: true |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
- has_one_attached:image

- belongs_to_active_hash:xategory
- belongs_to_active_hash:status
- belongs_to_active_hash:delivery_charge
- belongs_to_active_hash:deelivery_area
- belongs_to_active_hash:delivery_day

- belongs_to:user
- belongs_to:profile

## profiles テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association

- has_one:profile
- has_many:items
- belongs_to:user

## sends テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postalcode       | string     | null: false                    |
| delivery_area_id | integer    | null: false, foreign_key: true |
| municipalties    | string     | null: false,                   |
| address          | string     | null: false,                   |
| building         | string     | null: false,                   |
| phone            | string     | null: false,                   |
| profile_id       | references | null: false, foreign_key: true |

### Association

- belongs_to:send
- belongs_to_active_hash:delivery_area