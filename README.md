# Restaurant
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index: true|
|address|string|add_index: true|
|station|string|add_index: true|
|tel|string|add_index: true|
|image|string|
|email|string|unique: true, null: false|
|pass|string|unique: true, null: false|

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
|restaurant_id|integer|null: false, foreign_key: true|
## Associations
- belongs_to :restaurant

# Food
|Column|Type|Options|
|------|----|-------|
|name|string|add_index: true|
|price|string|add_index: true|
|comment|string|add_index: true|

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

## Associations
- belongs_to :restaurant

# Sake
|Column|Type|Options|
|------|----|-------|
|name|string|add_index: true|
|price|string|add_index: true|
|area|string|add_index: true|
|comment|string|add_index: true|

## Associations
- belongs_to :restaurant