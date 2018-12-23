class Category < ApplicationRecord

  has_many :categories_items, dependent: :destroy
  has_many :items, through: :categories_items

end