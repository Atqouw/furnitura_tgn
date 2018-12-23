class Item < ApplicationRecord

  has_many :categories_items, dependent: :destroy
  has_many :categories, through: :categories_items

end