class Order < ApplicationRecord

  has_secure_token :token

  monetize :amount_cents

  belongs_to :customer, optional: true

  has_many :items_orders, dependent: :destroy
  has_many :items, through: :items_orders

end