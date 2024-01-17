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
| mail               | string | null: false,unique: true |
| password           | string | null: false              |
| name               | string | null: false              |
| birth              | string | null: false              |

- has_many :items
- has_many :comments, through: :items
- has_many :comments

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| expantion    | text       | null: false                    |
| user         | references | null: false, foreign_key: true |

- belong_to :user
- has_many :comments
- has_one :order

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | text       | null: false                    |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :prototype

## order テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| information | string     | null: false                    |
| month       | string     | null: false                    |
| code        | string     | null: false                    |
| address     | string     | null: false                    |
| tel         | string     | null: false                    |

- belongs_to :item

