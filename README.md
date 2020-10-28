# HealthLunch

<img src="gyazo.jpg" width="100%" height="400px">

# 概要
<br>.商品購入機能</br>
<br>.ユーザー管理機能(devise)</br>
<br>.SNSアカウントログイン機能</br>
<br>.レビュー機能</br>
<br>.レーティング機能</br>
<br>.カート機能</br>
<br>.管理者機能(admin)</br>



# アプリURL
https://health-lunch.herokuapp.com/


# 制作背景
高齢化が進む現在、自宅に居ながら病院食と同じように栄養を考え調理することは非常に手間がかかります。
ご両親の介護をされている方、召し上がられるご高齢者の方が安心・安全で「食」という観点から健康的な生活ができるように作成致しました。

# テスト用アカウント
購入者
メールアドレス   ：　sho@ezweb.ne.jp
<br>パスワード   ：　sho12345

# DEMO


# １　トップページ

<img src="s1.png" width="100%" height="400px">
<img src="s2.jpg" width="100%" height="400px">


# 2 新規登録画面
<img src="gyazo8.jpg" width="100%" height="400px">


# 3 ログイン画面
<img src="gyazo7.jpg" width="100%" height="400px">

# 4 詳細画面
<img src="gyazo5.jpg" width="100%" height="400px">
<img src="gyazo6.png" width="100%" height="400px">

# 5 カート画面
<img src="cart1.png" width="100%" height="400px">

# 6 レビュー機能   
<img src="Videotogif.gif" width="100%" height="400px"> 
<img src="gyazo9.jpg" width="100%" height="400px">                           

# レスポンシブ
<img src ="Videotogif (9).gif" width="30%" height="450px">

# 工夫ポイント
レイアウト
文字の大きさ、色合い、40代〜60代の方が見やすいようにシンプルにコーティングしました。

# レビュー機能
詳細画面を見やすく、操作を簡単にしました。
認知度が低い介護食という観点から、レビュー機能を実装することにより、介護弁当の評価を実際に召し上がったユーザーに評価して頂き認知度を広めることを目的に作成しました。

# 環境開発
HTML CSS Ruby RubyonRails Javascript Heroku Git 

# 課題
メニューが1種類のみなので選択できるメニューを増やす予定です。

# ER図
<img src="er.png" width="70%" height="600px">

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


## review テーブル

| Column     | Type        | Options                        |
|------------|-------------|--------------------------------|
| user_id    |integer      | null: false, foreign_key: true |
| item_id    |integer      | null: false foreign_key: true |
| score      |string       | null: false                    |
| content    |string       | null: false                    |

association
<br>belongs_to :user

## cart テーブル
| Column     | Type        | Options                        |
|------------|-------------|--------------------------------|
| id　　　    |integer      | null: false, foreign_key: true |

association
<br>has_many :cart-item

## cart-item テーブル
| Column     | Type        | Options                        |
|------------|-------------|--------------------------------|
| user_id    |integer      | null: false, foreign_key: true |
| item_id    |integer      | null: false foreign_key: true |
| score      |string       | null: false                    |
| content    |string       | null: false                    |

association
<br>belongs_to :protein
<br>belongs_to :cart

## order テーブル
| Column        | Type        | Options                        |
|---------------|-------------|--------------------------------|
| cart_id       |integer      | null: false, foreign_key: true |
| total_parice  |integer      | null: false foreign_key: true  |

association
<br>has_one :purchase
<br>belongs_to :cart


