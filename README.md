# HealthLunch

<img src="gyazo.jpg" width="100%" height="400px">

# 概要
<br>.商品購入機能</br>
<br>.ユーザー管理機能(devise)</br>
<br>.SNSアカウントログイン機能</br>
<br>.レビュー機能</br>
<br>.レーティング機能</br>
<br>.管理者機能(admin)</br>



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
<img src="gyazo6.png" width="100%" height="400px">

5 レビュー機能   
<img src="gyazo10.jpg" width="100%" height="400px"> 
<img src="gyazo9.jpg" width="100%" height="400px">                           


# 工夫ポイント
レイアウト
文字の大きさ、色合い、40代〜60代の方が見やすいようにシンプルにコーティングしました。

レビュー機能
詳細画面を見やすく、操作を簡単にしました。
認知度が低い介護食という観点から、レビュー機能を実装することにより、介護弁当の評価を実際に召し上がったユーザーに評価して頂き認知度を広めることを目的に作成しました。

# 環境開発
Ruby RubyonRails Javascript Heroku 

# 課題
商品が１品ずつしか購入できない仕様になっているため、買い物カゴ機能の実装を行い、複数商品購入できるような仕様にして行きたいと考えています。

# データベース設計
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
<br>has_many :items
<br>has_many :buyers
<br>has_many :reviwes

## items テーブル

| Column              | Type   | Options     |
| --------------------| ------ | ----------- |
| name                | string | null: false |

associaiton
<br>belongs_to :user


## protein テーブル

| Column             | Type   | Options     |
|--------------------| ------ | ----------- |
| name               | string | null: false |
| acount             | string | null: false |
| price              | string | null: false |
| energy             | string | null: false |
| prote              | string | null: false |
| salt               | string | null: false |
| Lipid              | string | null: false |
| carbo              | string | null: false |

association 
<br>has_many :users
<br>belongs_to :protein


## soft テーブル
| Column              | Type   | Options     |
| --------------------| ------ | ----------- |
| name                | string | null: false |
| acount              | string | null: false |
| price               | string | null: false |
| energy              | string | null: false |
| prote               | string | null: false |
| salt                | string | null: false |
| Lipid               | string | null: false |
| carbo               | string | null: false |

association 
<br>has_many :users
<br>belongs_to :soft


## calo テーブル

| Column             | Type   | Options     |
|--------------------| ------ | ----------- |
| name               | string | null: false |
| acount             | string | null: false |
| price              | string | null: false |
| energy             | string | null: false |
| prote              | string | null: false |
| salt               | string | null: false |
| Lipid              | string | null: false |
| carbo              | string | null: false |

association 
<br>has_many :users
<br>belongs_to :calo


## buyer テーブル

| Column            | Type       | Options                       |
|-------------------|------------|-------------------------------|
| user_id           | integer    | null: false, foreign_key: true|
| protein_id        | integer    | null: false, foreign_key: true|

association
<br>belongs_to :protein
<br>belongs_to :user
<br>has_one :delivery

## bento テーブル

| Column         | Type    | Options                       |
|----------------|---------|-------------------------------|
| user_id        | integer | null: false, foreign_key: true|
| calo_id        | integer | null: false, foreign_key: true|
| user_id        | integer | null: false, foreign_key: true|
| calo_id        | integer | null: false, foreign_key: true|


association
<br>belongs_to :calo
<br>belongs_to :user
<br>has_one: :deli


## shohin テーブル

| Column         | Type    | Options                       |
|----------------|---------|-------------------------------|
| user_id        | integer | null: false, foreign_key: true|
| soft_id        | integer | null: false, foreign_key: true|
| user_id        | integer | null: false, foreign_key: true|
| soft_id        | integer | null: false, foreign_key: true|


association
<br>belongs_to :soft
<br>belongs_to :user
<br>has_one :add

## delivery テーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| buyer_id      | integer    | null: false, foreign_key: true |
| zip           | string     | null: false                    |
| region_id     | integer    | null: false                    |
| city          | string     | null: false                    |
| reference     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

association
<br>has_one :buyer

## deli テーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| calo_id       | integer    | null: false, foreign_key: true |
| zip           | string     | null: false                    |
| region_id     | integer    | null: false                    |
| city          | string     | null: false                    |
| reference     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

association
<br>has_one :bento


## add テーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| soft_id       | integer    | null: false, foreign_key: true |
| zip           | string     | null: false                    |
| region_id     | integer    | null: false                    |
| city          | string     | null: false                    |
| reference     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

association
<br>has_one :shohin

## review テーブル

| Column     | Type        | Options                        |
|------------|-------------|--------------------------------|
| user_id    |integer      | null: false, foreign_key: true |
| item_id    |integer      | null: false. foreign_key: true |
| score      |string       | null: false                    |
| content    |string       | null: false                    |

association
<br>belongs_to :user
