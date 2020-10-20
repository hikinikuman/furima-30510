# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | NOT NULL    |
| email            | string | NOT NULL    |
| password         | string | NOT NULL    |
| family_name      | string | NOT NULL    |
| first_name       | string | NOT NULL    |
| family_name_kana | string | NOT NULL    |
| first_name_kana  | string | NOt NULL    |
| birth_day        | date   | NOT NULL    |


### Association
 has_many : items
 has_many : purchases


## items テーブル

| Column          | Type      | Options                    |
| --------------- | --------- | -------------------------- |
| user            | reference | NOT NULL foreign_key: true |
| name            | string    | NOT NULL                   |
| description     | text      | NOT NULL                   |
| category_id     | integer   | NOT NULL                   |
| condition_id    | integer   | NOT NULL                   |
| postage_id      | integer   | NOT NULL                   |
| region_id       | integer   | NOT NULL                   |
| shipping_date_id| integer   | NOT NULL                   |
| price           | integer   | NOT NULL                   |


### Association
 belong_to :user
 has_one : purchase


## purchases テーブル

| Column    | Type       | Options                    |
| --------- | ---------- | -------------------------- |
| user      | references | NOT NULL foreign_key: true |
| item      | references | NOT NULL foreign_key: true |


### Association
belongs_to :user
belongs_to :item
has_one : address


## addresses テーブル

| Column        | Type       | Options                    |
| ------------- | ---------- | -------------------------- |
| post_code     | string     | NOT NULL                   |
| prefecture_id | integer    | NOT NULL                   |
| municipality  | string     | NOT NULL                   |
| address       | string     | NOT NULL                   |
| building_name | string     |                            |
| phone_num     | string     | NOT NULL                   |
| purchase      | references | NOT NULL foreign_key: true |

### Association
belongs_to :purchase

#### ＊ブランチ生成し忘れたのでブランチへのcommitも含めてこの行を生成しました。