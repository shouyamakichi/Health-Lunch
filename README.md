# HealthLunch

<img src="gyazo.jpg" width="100%" height="400px">

# 概要
.商品購入機能
.ユーザー管理機能
.SNSアカウントログイン機能
.レビュー機能
.レーティング機能
.管理者機能



# アプリURL
https://health-lunch.herokuapp.com/


# 制作背景
高齢化が進む現在、自宅に居ながら病院食と同じように栄養を考え調理することは非常に手間がかかります。
ご両親の介護をされている方、召し上がられるご高齢者の方が安心・安全で「食」という観点から健康的な生活ができるように作成致しました。

# 特徴
１　トップページ

<img src="gyazo2.jpg" width="100%" height="400px">
<img src="gyazo3.jpg" width="100%" height="400px">


2 新規登録画面
<img src="gyazo8.jpg" width="100%" height="400px">


3 ログイン画面
<img src="gyazo7.jpg" width="100%" height="400px">

4 詳細画面
<img src="gyazo5.jpg" width="100%" height="400px">
<img src="gyazo4.jpg" width="100%" height="400px">



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
has_many reviwes

## items テーブル
| Column              | Type   | Options     |
| --------------------| ------ | ----------- |
| name               | string | null: false |



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


## soft テーブル
 --------------------| ------ | ----------- |
| name               | string | null: false |
| acount             | string | null: false |
| price              | string | null: false |
| energy             | string | null: false |
| prote              | string | null: false |
| salt               | string | null: false |
| Lipid              | string | null: false |
| carbo              | string | null: false |

association 
has_many users
belongs_to soft


## calo テーブル
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
belongs_to calo


## buyer テーブル
| user_id           | integer | null: false, foreign_key: true|
| protein_id        | integer | null: false, foreign_key: true|

association
belongs_to  protein
belongs_to user
has_one delivery

## bento テーブル
| user_id           | integer | null: false, foreign_key: true|
| calo_id        | integer | null: false, foreign_key: true|

association
belongs_to  calo
belongs_to user
has_one deli


## shohin テーブル
| user_id           | integer | null: false, foreign_key: true|
| soft_id        | integer | null: false, foreign_key: true|

association
belongs_to  soft
belongs_to user
has_one add

## delivery テーブル
| buyer_id      | integer    | null: false, foreign_key: true |
| zip           | string     | null: false                    |
|region＿id     | integer    | null: false                    |
| city          | string     | null: false                    |
| reference     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

association
has_one buyer

## deli テーブル
| calo_id      | integer    | null: false, foreign_key: true |
| zip           | string     | null: false                    |
|region＿id     | integer    | null: false                    |
| city          | string     | null: false                    |
| reference     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

association
has_one bento


## add テーブル
| soft_id      | integer    | null: false, foreign_key: true |
| zip           | string     | null: false                    |
|region＿id     | integer    | null: false                    |
| city          | string     | null: false                    |
| reference     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

association
has_one shohin

## review テーブル
| user_id    |integer      | null: false, foreign_key: true |
| item_id    |integer      | null: false. foreign_key: true |
| score      |string       | null: false                    |
| content    |string       | null: false                    |

association
belongs_to :user
