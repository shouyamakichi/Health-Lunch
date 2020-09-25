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
has_many buyers

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

association 
has_many users
belongs_to protein


## buyer テーブル
| user_id           | integer | null: false, foreign_key: true|
| protein_id           | integer | null: false, foreign_key: true|

association
belongs_to  protein
belongs_to user
has_one delivery

## delivery テーブル
| buyer_id  | integer    | null: false, foreign_key: true |
| zip           | string     | null: false                    |
|region＿id     | integer    | null: false                    |
| city          | string     | null: false                    |
| reference     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |