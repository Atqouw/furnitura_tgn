class Item < ApplicationRecord

  monetize :sale_price_cents

  mount_uploader  :photo,  PhotoUploader

  has_many :categories_items, dependent: :destroy
  has_many :categories, through: :categories_items

  has_many :attachments, as: :attachable

  accepts_nested_attributes_for :categories_items, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true

  def price_with_discount
    return sale_price if discount_percent.blank?
    Money.new(sale_price.cents - (sale_price.cents * discount_percent / 100))
  end

end