# アプリ名
### CellarSearch  
- Cellar→貯蔵目的の地下室や穴蔵  
- 消費者が飲みたいお酒を飲食店の「Cellar」から見つけられるアプリにしたいという思いから命名しました。

# 概要
  ドリンクメニューから飲食店の検索ができるwebアプリです。  
  飲みたいドリンクや、生産地を入力することで取り扱いのあるお店が表示されます。  
  地域の条件を付け足して、近隣のお店を検索することも可能です。  

# 制作背景
  商品を求めている消費者と、その商品を扱っている飲食店を繋げられるツールになればと思い開発しました。  
  <br>
  特定の飲みたいドリンクを探す時、既存の飲食店検索サイトだと下記の流れとなり、希少なドリンクを探そうとするほど大変です。  
  <br>①エリア、店名からお店を検索
  <br>↓
  <br>②店舗ページからメニューを確認
  <br>↓
  <br>③探しているドリンクの有無を確認
  <br>↓
  <br>④取り扱いが無ければ見つかるまで①〜③を繰り返し。
  
  この手間を削減しより手軽にドリンクから飲食店を見つけられるのがCellarSearchです。
  ドリンクの名前や生産地から飲食店を検索し、そのドリンクを扱っている飲食店の一覧を表示します。(上記の①の時点で条件の設定が可能)
  例えば、”新潟県の日本酒が飲みたい”という時には、日本酒検索欄の生産地に「新潟」と入力し  
  近隣エリアを入力すれば、近隣で新潟の日本酒を取り扱っている飲食店を一発で発見できます。  

  前職の酒類を販売する営業を行っている中で、顧客である飲食店の方から 
  良いお酒を仕入れたのに「あまり注文されず廃棄になった」というお話を顧客から多く伺いました。  
  そのお酒を求めている人は必ずいるにも関わらず、見つけてもらえないことを理由に廃棄になることが非常に残念に感じていたため、それを解決できるツールにしたいです。
  
# DEMO

## トップページ
![CellarSearchトップページ](https://user-images.githubusercontent.com/67886161/92354289-0052e680-f11d-11ea-93ac-3da9ddbd2985.png)
ransackを使用しました。部分一致検索です。  
必要な情報のみを入力し、条件に当てはまる飲食店の検索ができます。  

## 新規登録画面
<img width="1410" alt="CellarSearch新規登録画面" src="https://user-images.githubusercontent.com/67886161/92354429-3d1edd80-f11d-11ea-832e-234e0c64f7a4.png">
トップページ→店舗ログイン・新規登録  
deviseを使用した飲食店の登録フォームです。  

## 検索結果画面
検索ワード  
日本酒生産地 "新潟県"、最寄駅 "中野駅"  
<img width="1408" alt="CellarSearch検索結果" src="https://user-images.githubusercontent.com/67886161/92354483-59227f00-f11d-11ea-9526-151e2190fa1c.png">
トップページ→フォームを入力し検索ボタンをクリック  
検索ワードの条件を満たす飲食店の一覧です。  

## 店舗詳細画面
![CellarSearch店舗詳細](https://user-images.githubusercontent.com/67886161/92354517-6fc8d600-f11d-11ea-8b66-b6d72b9369de.png)
検索結果→店舗ページへ  
飲食店が登録したフード、ドリンク、日本酒、ワインのメニューを一覧できます。  

## 店舗編集画面
<img width="1387" alt="CellarSearch店舗編集" src="https://user-images.githubusercontent.com/67886161/92354553-84a56980-f11d-11ea-8697-04b6f44e44dd.png">
ヘッダーの店舗情報編集をクリック  
ログインしている店舗の編集ができます。  

## メニュー編集画面（ドリンク）
<img width="1414" alt="CellarSearchドリンク編集" src="https://user-images.githubusercontent.com/67886161/92354586-91c25880-f11d-11ea-90a1-183cf143e12b.png">
店舗編集画面→ドリンク変更はこちら  
ログインしている店舗のメニュー編集ができます。  
- 非同期通信を実装しています。
- 下部には店舗に現在登録されているメニューを表示。  
- その他のメニュー編集についても大方同じ見た目、仕様になっております。  

# 工夫したポイント

- 機械が苦手な方でも使いやすくするために、字を大きく、全体的にビューをシンプルにしました。  
- 日本酒やワインを別のテーブルにし、詳細な条件を検索できるようにすることで、  
ニッチな商品を求める消費者と飲食店を繋げやすくしました。  
- gemを使用し効率良く制作を進めました。
　ransack：複数テーブルの条件を検索する為に使用
　bootstrap：ビューファイルを効率よく作成。ユーザビリティを考慮しaccordion機能を使用。

# 使用技術(開発環境)
## フロントエンド
Haml,Sass,JavaScript,jQuery,Ajax
## バックエンド
Ruby,Ruby on Rails
## データベース
MySQL,SequelPro
## ソース管理
Github,GithubDesktop
## エディタ
Visual Studio Code

# 今後実装したい機能
- SNS連携を活用したユーザー（検索するユーザー）登録の実装  
- 飲食店がユーザー向けに情報発信できるタイムラインの導入  
- 飲食店のジャンルによる検索  

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
