# README

## users テーブル

| Column              | Type   | Options     |
| --------------------| ------ | ----------- |
| email               | string | null: false |
| password            | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_kana      | string | null: false |
| first_name_kana     | string | null: false |

association
item
buyer

## items テーブル
| Column              | Type   | Options     |
| --------------------| ------ | ----------- |
| name               | string | null: false |
| image              | string | null: false |
| acount             | string | null: false |
| price              | string | null: false |
| user_id           | integer | null: false, foreign_key: true|
| energy            | string | null: false |
| prote             | string | null: false |
| salt              | string | null: false |
| Lipid              | string | null: false |
| carbo              | string | null: false |

## protein テーブル
 --------------------| ------ | ----------- |
| name               | string | null: false |
| acount             | string | null: false |
| price              | string | null: false |
| energy            | string | null: false |
| prote             | string | null: false |
| salt              | string | null: false |
| Lipid              | string | null: false |
| carbo              | string | null: false |