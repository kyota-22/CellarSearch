# アプリ名
  CellarSearch
  Cellar→貯蔵目的の地下室や穴蔵
  消費者が探している商品を飲食店の「Cellar」から見つけられるアプリにしたいという思いから命名しました。

# 概要
  ドリンクメニューから飲食店の検索ができるwebアプリです。
  飲みたいドリンクや、生産地を入力することで取り扱いのあるお店が表示されます。
  地域の条件を付け足して、近隣のお店を検索することも可能です。

# 制作背景
  特定の飲みたいドリンクを探す時、既存の飲食店検索サイトでは
  店舗ページ→メニュー確認を経て、求めている商品の有無を確認する。という手間が発生します。
  商品名や商品の生産地から検索できるようになることで、その商品を扱っているお店の一覧表示を可能にします。
  例えば、”新潟県の日本酒が飲みたい”という時には、日本酒検索欄の生産地に「新潟」と入力し
  探しているエリアを入力すれば、近隣で新潟の日本酒を取り扱っている飲食店を発見できます。

  また、前職の酒類を顧客である飲食店向けに販売している営業を行っている中で
  良いお酒を仕入れたのに「あまり注文されず廃棄になった」というお話を顧客から多く伺いました。
  そのお酒を求めている人は必ずいるにも関わらず、廃棄になることが非常に残念だったので
  商品を扱っているお店、その商品を求めている消費者を繋げられるツールになればと思い開発しました。

# DEMO

## トップページ
https://user-images.githubusercontent.com/67886161/92348305-bdd5dd80-f10d-11ea-9ee2-6f0364ab12b3.png

ransackを使用しました。部分一致検索です。
必要な情報のみを入力し、条件に当てはまる飲食店の検索ができます。

## 新規登録画面
https://user-images.githubusercontent.com/67886161/92348514-48b6d800-f10e-11ea-932f-726e14b57659.png

トップページ→店舗ログイン・新規登録
deviseを使用した飲食店の登録フォームです。

## 検索結果画面
検索ワード
日本酒生産地 "新潟県"、最寄駅 "中野駅"
https://user-images.githubusercontent.com/67886161/92351472-ca126880-f116-11ea-8998-45890d450f31.png

トップページ→フォームを入力し検索ボタンをクリック
検索ワードの条件を満たす飲食店の一覧です。

## 店舗詳細画面
https://user-images.githubusercontent.com/67886161/92351757-718f9b00-f117-11ea-94ec-b41e589ba0c1.png

検索結果→店舗ページへ
飲食店が登録したフード、ドリンク、日本酒、ワインのメニューを一覧できます。

## 店舗編集画面
https://user-images.githubusercontent.com/67886161/92352419-02b34180-f119-11ea-8245-07e14569e403.png

ヘッダーの店舗情報編集をクリック
ログインしている店舗の編集ができます。

## メニュー編集画面（ドリンク）
https://user-images.githubusercontent.com/67886161/92351897-c4695280-f117-11ea-85e7-42bd5c51892f.png

店舗編集画面→ドリンク変更はこちら
ログインしている店舗のメニュー編集ができます。
非同期通信を実装しています。下部には店舗に現在登録されているメニューを表示。
その他のメニューについても大方同じ見た目、仕様になっております。

# 工夫したポイント

・機械に弱い飲食店の方が使用することを想定し、字を大きく、全体的にビューをシンプルにしました。

・日本酒やワインを別のテーブルにし、詳細な条件を検索できるようにすることで、
  ニッチな商品を求める消費者と飲食店を繋げやすくしました。

# 使用技術(開発環境)
## フロントエンド
Haml,Sass
## バックエンド
Ruby,Ruby on Rails
## データベース
MySQL
## ソース管理
Github,GithubDesktop
## エディタ
Visual Studio Code

# 今後実装したい機能
・SNS連携を活用したユーザー（消費者）登録の実装
・飲食店がユーザー向けに情報発信できるタイムラインの導入
・飲食店のジャンルによる検索

# DB設計

## Restaurant
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index: true|
|address|string|add_index: true|
|station|string|add_index: true|
|tel|string|add_index: true|
|image|string|
|email|string|unique: true, null: false|
|password|string|unique: true, null: false|

### Associations
- has_many :foods
- has_many :drinks
- has_many :wines
- has_many :sakes

## Drink
|Column|Type|Options|
|------|----|-------|
|name|string|add_index: true|
|price|string|add_index: true|
|comment|string|add_index: true|
|restaurant_id|integer|null: false|
### Associations
- belongs_to :restaurant

## Food
|Column|Type|Options|
|------|----|-------|
|name|string|add_index: true|
|price|string|add_index: true|
|comment|string|add_index: true|
|restaurant_id|integer|null: false|

### Associations
- belongs_to :restaurant

## Wine
|Column|Type|Options|
|------|----|-------|
|name|string|add_index: true|
|price|string|add_index: true|
|color|string|add_index: true|
|area|string|add_index: true|
|variety|string|add_index: true|
|comment|string|add_index: true|
|restaurant_id|integer|null: false|

### Associations
- belongs_to :restaurant

## Sake
|Column|Type|Options|
|------|----|-------|
|name|string|add_index: true|
|price|string|add_index: true|
|prefecture|string|add_index: true|
|comment|string|add_index: true|
|restaurant_id|integer|null: false|

### Associations
- belongs_to :restaurant
