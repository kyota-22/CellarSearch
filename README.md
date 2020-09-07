# アプリ名
  CellarSearch

# 概要
  ドリンクメニューから飲食店の検索ができるwebアプリです。

# 本番環境


# 制作背景
  例えば”地元の日本酒が飲みたい”という時に、既存の検索サイトでは
  店舗ページ→メニュー確認を経て、求めている商品の有無を確認する手間が発生します。
  商品名や生産地から検索できるようになることで、探している商品を扱っているお店の一覧表示が可能になり、
  地元の日本酒を扱っているお店を発見できます。地域や店名を含めた検索も可能です。
  商品を扱っているお店、求めている消費者を繋げられるツールになればと思って開発しました。

# DEMO

## トップページ

# 工夫したポイント


# 使用技術(開発環境)


# 課題や今後実装した機能


# Restaurant
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index: true|
|addres|string|add_index: true|
|station|string|add_index: true|
|tel|string|add_index: true|
|image|string|
|email|string|unique: true, null: false|
|password|string|unique: true, null: false|

## Associations
- has_many :foods
- has_many :drinks
- has_many :wines
- has_many :sakes

# Drink
|Column|Type|Options|
|------|----|-------|
|name|string|add_index: true|
|price|string|add_index: true|
|comment|string|add_index: true|
|restaurant_id|integer|null: false|
## Associations
- belongs_to :restaurant

# Food
|Column|Type|Options|
|------|----|-------|
|name|string|add_index: true|
|price|string|add_index: true|
|comment|string|add_index: true|
|restaurant_id|integer|null: false|

## Associations
- belongs_to :restaurant

# Wine
|Column|Type|Options|
|------|----|-------|
|name|string|add_index: true|
|price|string|add_index: true|
|type|string|add_index: true|
|area|string|add_index: true|
|variety|string|add_index: true|
|comment|string|add_index: true|
|restaurant_id|integer|null: false|

## Associations
- belongs_to :restaurant

# Sake
|Column|Type|Options|
|------|----|-------|
|name|string|add_index: true|
|price|string|add_index: true|
|prefecture|string|add_index: true|
|comment|string|add_index: true|
|restaurant_id|integer|null: false|

## Associations
- belongs_to :restaurant
