class Item < ApplicationRecord

  monetize :sale_price_cents

  has_many :categories_items, dependent: :destroy
  has_many :categories, through: :categories_items

  has_many :attachments, as: :attachable

  accepts_nested_attributes_for :categories_items, reject_if: :all_blank, allow_destroy: true

end