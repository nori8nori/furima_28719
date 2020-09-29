# README

【アプリ名】

FURIMA（フリマアプリのクローンサイト）

【アプリケーションの概要】

・ユーザー登録

・商品出品

・出品商品の編集/削除

・商品購入（クレジットカード決済）

【本番環境】

《デプロイ先》

https://furima-28719.herokuapp.com/

《テストアカウント》

・ID:admin

・Pass:2222

《テスト用アカウント/購入者側》

・メールアドレス:tarou@gmail.com

・Pass:tarou88

《購入用カード情報》

・番号：4242424242424242

・期限：2月22年

・セキュリティコード：123

《テスト用アカウント/出品者側》

・メールアドレス:hanako@gmail.com

・Pass:hanako88

【制作背景】
テックキャンプエンジニア転職の最終カリキュラムで作成したフリーマーケットのwebサイトです。READMEから始まり全ての機能を実装するまで約200時間かかりました。

【DB設計】

新規登録：
https://gyazo.com/17bfcb47d8a70d371f15001e4408d5c2

ログイン:
https://gyazo.com/742d37b05fd3c9cd8805bf40ea995fb9

商品出品:
https://gyazo.com/616a53dd31f324501710779ae361e106

出品商品編集:
https://gyazo.com/e80cfb5f69266a0c275b2d05249aa35c

出品商品削除:
https://gyazo.com/968270597d62e39fd1527e70e2d4a31a

商品購入:
https://gyazo.com/94877a5ee9f42ff87349409b7c8c9bea


【工夫したポイント】
自身のできなかった部分や間違った（エラーが起きた）部分を記録として残すことで、間違える回数を減らす工夫を行いました。初めの段階では、制作速度がなかなか上がりませんでしたが、最後の方はスムーズに作成が進みました。

【実装予定の内容】
・商品に対してのコメント機能を追加する
・商品に対してお気に入り登録を加える
・パンくず機能の実装
・検索機能の実装
・「カテゴリー」「ブランド」が未実装なので項目を追加する


DB設計:
https://gyazo.com/19108c886fea434f67fb04163f06720a


【アプリケーションで使用している技術】
・インフラ：heroku
・データベース：MySQL/AWS(S3)
・開発環境：visual studio code
・言語：Ruby on Rails/JavaScript

【アクリケーションの機能】
・認証機能（ログイン）：devise
・商品購入機能：payjp
・コメント機能
・画像添付機能：active_hash/mini_magick/AWS(S3)


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

- has_many :items
- has_many :profiles

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

- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_charge
- belongs_to_active_hash :deelivery_area
- belongs_to_active_hash :delivery_day

- belongs_to :user
- has_one :buy

## buy テーブル

| Column   | Type       | Options                    |
| ---- | ---------- | ------------------------------ |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association

- has_one :oder
- belongs_to :item
- belongs_to :user

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postalcode       | string     | null: false                    |
| delivery_area_id | integer    | null: false                    |
| municipalties    | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| phone            | string     | null: false                    |
| buy              | references | null: false, foreign_key: true |

### Association

- belongs_to :buy
- belongs_to_active_hash :delivery_area