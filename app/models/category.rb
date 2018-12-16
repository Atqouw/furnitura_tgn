class Category < ApplicationRecord

  has_many :items
  has_many :categories_item, dependent: :destroy

end