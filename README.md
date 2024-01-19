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

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| first_name_kanji   | string | null: false              |
| last_name_kanji    | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| birth              | date   | null: false              |

- has_many :items
- has_many :history

## items テーブル

| Column          | Type       | Options                        |
| ----------------| ---------- | ------------------------------ |
| title           | string     | null: false                    |
| expantion       | text       | null: false                    |
| category _id    | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| delivery_cost_id| integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| date_id         | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

- belong_to :user
- has_many :comments
- has_one :history

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | text       | null: false                    |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :prototype

## order テーブル

| Column         | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| number         | string     | null: false                    |

- belongs_to :item
- belongs_to :history

## history テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

- belong_to :user
- belong_to :item
- belongs_to :order